Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853F73BBA06;
	Tue, 24 Mar 2026 08:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341887; cv=none; b=slCiyIO8Trq9uSmRHNZ+oS/IFKe3XuekKO6g1QBw0OEgZ0XavkFkNehOVH6IIDVLVipSpzsjPmCvvp6/gJX+i2w45Pw8RwhiO1pdgz7zWGna6yP2vEJ/QAwON9HApKxwgjPnu/F8UXnD6LW9P9weHQMs+2CZ+n2Cx0Tm9wpZsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341887; c=relaxed/simple;
	bh=cGtYVl2fr+pZ5FWp8Z9AvNZ6p0dL5XfRSVVR4HUPRow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgZaXZE6gsrs/hCEx39J+4iv6vj10kP0whCe1uU/aApKwvybYZ39AD5oq/tGGtFlur+hgPZKK0Nj7VsiA86URwUK8oT1EH299/q+VtAqdBTJxW87RzFa5y1B2xn6VqkArKVCBdgAAb9OFOpkjKDvgEU6NnfWjYCUYB+q6EoAv/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUBIdu39; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUBIdu39"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CAFBC19424;
	Tue, 24 Mar 2026 08:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341886;
	bh=cGtYVl2fr+pZ5FWp8Z9AvNZ6p0dL5XfRSVVR4HUPRow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GUBIdu398BiRjrZ4jdlaWApaETC0kyBH2SUeSOJzeTumDNfmfuLdQwIrAJSeqkPME
	 dcH039wHpQDz54H/MKvp+DGYDYQGAb1QrzZuEYloXXLPzO+f8hiU01bWaLNoaO24Af
	 u0o2n/NBCviC49TkEpcltOF7CuvXlZ9qEwnMyJwN7460s/HHUjsbAX6wc1mKc7SGp5
	 B2V3/HDGmsTXPvpaSKuncOc/k+9wrBJWddv0sJpbq+wZRNqRfaOsKqMVytDycQNxhI
	 ClYpU/+d2Xk1r2MY/KRJv5vs9+phlmeAoAjpfoLmjsus/vB71DA6Oyak+7M/OusJ2v
	 NGguAufLBE48A==
Date: Tue, 24 Mar 2026 09:44:41 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	arnd@arndb.de
Cc: mark.rutland@arm.com, bjorn.andersson@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>, soc@lists.linux.dev
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <acJO+fhjeguDZaRa@lpieralisi>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>

[+Arnd, arm-soc - to pick this up please]

On Wed, Dec 31, 2025 at 09:51:26PM +0530, Manivannan Sadhasivam wrote:
> From: Konrad Dybcio <konradybcio@kernel.org>
> 
> PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> firmware to implement the suspend to RAM (S2RAM) functionality by
> transitioning the system to a deeper low power state. When the system
> enters such state, the power to the peripheral devices might be removed. So
> the respective device drivers must prepare for the possible removal of the
> power by performing actions such as shutting down or resetting the device
> in their system suspend callbacks.
> 
> The Linux PM framework allows the platform drivers to convey this info to
> device drivers by calling the pm_set_suspend_via_firmware() and
> pm_set_resume_via_firmware() APIs.
> 
> Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call the above
> mentioned APIs in the psci_system_suspend_begin() and
> psci_system_suspend_enter() callbacks.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> [mani: reworded the description to be more elaborative]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> 
> This patch was part of an old series that didn't make it to mainline due to
> objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
> https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com/
> 
> But this patch on its own is useful for platforms implementing the S2RAM
> feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
> resending it.
> 
>  drivers/firmware/psci/psci.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

> diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> index 38ca190d4a22..e73bae6cb23a 100644
> --- a/drivers/firmware/psci/psci.c
> +++ b/drivers/firmware/psci/psci.c
> @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long unused)
>  
>  static int psci_system_suspend_enter(suspend_state_t state)
>  {
> +	pm_set_resume_via_firmware();
> +
>  	return cpu_suspend(0, psci_system_suspend);
>  }
>  
> +static int psci_system_suspend_begin(suspend_state_t state)
> +{
> +	pm_set_suspend_via_firmware();
> +
> +	return 0;
> +}
> +
>  static const struct platform_suspend_ops psci_suspend_ops = {
>  	.valid          = suspend_valid_only_mem,
>  	.enter          = psci_system_suspend_enter,
> +	.begin          = psci_system_suspend_begin,
>  };
>  
>  static void __init psci_init_system_reset2(void)
> -- 
> 2.48.1
> 
