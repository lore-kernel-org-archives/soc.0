Return-Path: <SRS0=oWgg=DA=infradead.org=rdunlap@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E196FC001DC
	for <soc@archiver.kernel.org>; Fri, 14 Jul 2023 15:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A23D9C433CA; Fri, 14 Jul 2023 15:04:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83E0EC433C9;
	Fri, 14 Jul 2023 15:04:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83E0EC433C9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=qkCLhchmFE6Ae0iC8ZYvyTVa+UOqDTQhu4Aq6+1S4Xw=; b=lBOjZeMIMEUpxXjADFtB3DDa77
	Sssnp153TrRmreFV3fpKhKKAR9RmFUQ9/sx86lLWLcSt7JvFsYwaS6EmQ4ah9MMlG8HtPhRhcJ15g
	TbkbeNO1mo6++2ARehIbb7ptpTZ1Kq8snGkUvGhpD4FHJXbE0cDfNYrIgaZ/n+xI0fd8Ym7b105kv
	S/ktaDSWFC+d9pDEBMJDxwR8OJlZ/wTJ9i/sPeVPc/gD5kZXoVoqPNpr9UFHH1p0Q57kMavNI4tqB
	+dFoIHzlP8ZzxjophTo2TZSsuZmEIjnWNNAa1rp2hmlGpXNU0hrvmNGFX047YrfCnbxpzkHUUplhV
	KdH/1tqA==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qKKL7-006TC1-01;
	Fri, 14 Jul 2023 15:04:13 +0000
Message-ID: <ccf1e027-1f36-3dfb-af65-c7eea27c89cb@infradead.org>
Date: Fri, 14 Jul 2023 08:04:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/3] MAINTAINERS: soc: reference maintainer profile
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Nishanth Menon <nm@ti.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230714084725.27847-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/14/23 01:47, Krzysztof Kozlowski wrote:
> Mention the SoC maintainer profile in P: entry.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Yes, please.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f646ba70a01b..b61289fa7891 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1558,6 +1558,7 @@ M:	Olof Johansson <olof@lixom.net>
>  M:	soc@kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> +P:	Documentation/process/maintainer-soc.rst
>  C:	irc://irc.libera.chat/armlinux
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
>  F:	Documentation/process/maintainer-soc.rst

-- 
~Randy
