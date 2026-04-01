Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB103FF8A8
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044077; cv=none; b=Z4TR9eT9g5GZk13IMwjlPnF48/tWgLgPXjFt4Bi8YZ2JGNari6F1fawTZUHvK9YwlMVr9EeItR+B/uTNHpT+aeNW3FMXX6O27c6UrbpsMa0l4ClNYyjkoZXyE67xIVK+k09BxTJASf36mQZm0alk6ypfnhIh4W64lKCJ/yKe3jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044077; c=relaxed/simple;
	bh=J9xPXY4c9/hlpTH54aV46gW8mH+CjxJY3bUqufY9wWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POFDhzb1fDdxRB/TyRwFAqnhv3NHujHKpNaBU0rUU62mBQySQST00tygnu8r0OflCDObDe43TAmZVfKZOp7re4XpuACAMza6TSYmvbawebR+WmPnJVPq+BYGfYiJT7mN8jirkfDM1DjtniBB1ZDxha+mc0Ei9o+btMF1s4OS8Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qCUAPXe8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qCUAPXe8"
Received: by smtp.kernel.org (Postfix)
	id 97C9BC2BCB2; Wed,  1 Apr 2026 11:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0207CC116C6;
	Wed,  1 Apr 2026 11:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044077;
	bh=J9xPXY4c9/hlpTH54aV46gW8mH+CjxJY3bUqufY9wWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qCUAPXe8wR4D4KukxlibgmO7f8bkBCKfigB8j5EsIT6B+kKoZfWDz32pzlW44cQPS
	 O3MsLv002aQXCfUP8bktnHCfMQ9QcDj2mK2UU8gSBEdgjQBUTttDax18FD9JcEHpJZ
	 PnlJlLmc675E5+VI9L8UeQmCXpDRKE4varWRgAWJTkrK5j49rzmYphOcDbsDZYB3yE
	 6IPX7CdrVcgXZqF9m4v7O9Is70CeQkaApRxPLb6Pp4mIBfEyzh72ohmvI1X2poKEHC
	 Q1rNamnM9jl0dm1j8N4qJT8UZKO75NLgRa/7heioNLxzuoAZm7u6IVkge4QmDqkvhf
	 xU9zzyacEXuHw==
Date: Wed, 1 Apr 2026 13:47:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [GIT PULL] Qualcomm driver fixes for v7.0
Message-ID: <20260401-mighty-crow-of-upgrade-b17bd3@quoll>
References: <20260326133119.66268-1-andersson@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326133119.66268-1-andersson@kernel.org>

On Thu, Mar 26, 2026 at 08:31:19AM -0500, Bjorn Andersson wrote:
> 
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-7.0
> 
> for you to fetch changes up to a343fb1e03cfc9f6dc83a5efb2a8d33e9cdaf6b9:
> 
>   soc: qcom: pmic_glink_altmode: Fix TBT->SAFE->!TBT transition (2026-03-18 21:51:11 -0500)
> 
> ----------------------------------------------------------------
> Qualcomm driver fixes for v7.0
> 
> Fix the length of the PD restart reason string in pd-mapper to avoid
> QMI decoding errors, resulting in the notification being dropped.
> 
> Fix the newly introduce handling of TBT/USB4 notifications in pmic_glink
> altmode driver, as it broke the handling of non-TBT/USB4 DisplayPort
> unplug events.
> 

Thanks, applied

Best regards,
Krzysztof

