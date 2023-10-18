Return-Path: <chanwoo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3712CDB47E
	for <soc@archiver.kernel.org>; Wed, 18 Oct 2023 17:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 54841C433C9; Wed, 18 Oct 2023 17:00:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F68C433C8;
	Wed, 18 Oct 2023 17:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697648452;
	bh=jadXBfBNDt/OzU60G+jiwxmMqs4W4sMRyBWYKvzgbJA=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=LKons9aQOUYKzW6/EZ+IGviaKI9f2UECcfQHKYu55HG7gevCJNGlfrNK1jLlGhOE+
	 os1v6qRduItB9ttViLFkwaU1IDTBL4aexlbCWFdFdoKusTIkNSxUKYsWzOkLeBTxV2
	 vJeM9qJRjh/O+wziCd20Su8rkqZaGwiR5B8reKqL6pa/TWdaz2uNU7Eb+uD6Blnkjp
	 4kHtUmW4WrUN7wwEG0I8DLxcHM3m3X44axBdIqOPBxwuRNajQAorBj7j3jsoGiVcHo
	 gsQi7yGAu2nS6eBHYNk87D7ql0poD58XTDCfwKEegOfZm4oauVaQa5At2wqTTjb109
	 phIlStqYAKWZg==
Message-ID: <e17da9bf-4e24-4459-87d2-f5b6d5c4ca8e@kernel.org>
Date: Thu, 19 Oct 2023 02:00:45 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/20] clk: samsung: clk-gs101: add CMU_APM support
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, gregkh@linuxfoundation.org, cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-12-peter.griffin@linaro.org>
From: Chanwoo Choi <chanwoo@kernel.org>
In-Reply-To: <20231011184823.443959-12-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23. 10. 12. 03:48, Peter Griffin wrote:
> This patch adds all the registers for the APM clock controller unit.
> 
> We register all the muxes and dividers, but only a few of the
> gates currently for PMU and GPIO.
> 
> One clock is marked CLK_IS_CRITICAL because the system
> hangs if this clock is disabled.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/clk/samsung/clk-gs101.c | 301 ++++++++++++++++++++++++++++++++
>  1 file changed, 301 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
> index e2c62754b1eb..525f95e60665 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -19,6 +19,7 @@
>  

Looks good to me.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Samsung Electronics
Chanwoo Choi

