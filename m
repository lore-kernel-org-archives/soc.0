Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39002C678DB
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 09:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F1DD6C4339C; Fri, 24 Feb 2023 09:13:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB520C433EF;
	Fri, 24 Feb 2023 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677229999;
	bh=4K/aI3J1SHsNocBnRMEANq3tUwJQJ++vf4cUHRB9t54=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=BgU+845nE5HLD7mFEsPqCeEcbd4Ktakv+wu9/vchESsVRp83tWbsSbWh9OnAuaPTB
	 lnb6pWQgnoJaD2+FLmrfSy6LVuLvq/VElg906JjwBc25eu6a0h4mQBtOzN3noyuC7A
	 WvJxf1erWtm35is3QibO0AOHWBi+p05JrWLaIeivGNYCtvHtV3T35uO26W2JSm/35/
	 A0eVLG1aEvGiFEMO46l6bw83qtIqTLRm/PpYVmXeYpcOaFqGWk/QwkBOA62pw9Krvr
	 mf1irU8ZHE7nXN5/zcFn/LM+W3txvk2w65g2QyUcqrYOLdm072ZiFay0O1LtKmfdAA
	 gYD/dv8fSmgtA==
Message-ID: <8b829332-5cd7-2910-88db-513716e0919a@kernel.org>
Date: Fri, 24 Feb 2023 10:13:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20221226123630.6515-5-pali@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26/12/2022 13:36, Pali Rohár wrote:
> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>
> ---
>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
>  1 file changed, 118 insertions(+)

NAK, because:
1. You received comments for this to fix which you ignored:
https://lore.kernel.org/all/ebf5029e-83fd-e50d-b7cb-eae1b64f7145@linaro.org/
Implement the feedback you got.

2. You sent it now - without changes, ignoring feedback  - not cc'ing DT
maintainers.

Best regards,
Krzysztof

