Return-Path: <SRS0=hwcs=KJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB70C433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 07:37:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8272613DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 May 2021 07:37:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8272613DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NjbZq1b7XHsAqjBlzrLTxFCugh/9+F0ixf5lZUDqoXI=; b=MhsPReQGWzh83KVvL5DDF/rL6
	0bWD3bgCOE/LDy8FpbqOgevGgEMZJ5db/G2k6j5ju36s+dLc/ZFUgHl0iqP38eX/N4A6Gs4drM80g
	juCRDX9L66IYrbIUi1QjGvjFrQ6YWA/QMveSu3KBR2L5JiqgdJaVDJrn81nVUPp7BI19K5CYftXeD
	15aaveQiKseHgAFh87jABq0UqgwJ3nccU54SikzZI0ZRxnDS6IsiE/dvUPjsdkaRWF3Q30R2M4Mpa
	B5WmGeY1dry3q2cn8VKzkfSsTDK3X1HpLylUg6Vi75lGWnQdxcUUhUl7XIsLjZbVGfuR6/l9bZhMP
	cEN25ikdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhSNu-007Oj2-5c; Fri, 14 May 2021 07:37:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSNj-007Ohz-7l
 for linux-amlogic@desiato.infradead.org; Fri, 14 May 2021 07:37:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=Xie40h+gZ1kzYUn1rROBwrR8QVBZ1vuhKr3GMAIK+Q8=; b=eFE7fL5WDw6WcuCBdq6NaMHOAk
 b5CfIFjqAeGxMyYdtwDInYLwNMEIVw08OtfIO1zDcNE96N2oFPdeVOhpK7fbPu0v6bbBV5tP+erY7
 GmHk6lgbdsQMNpOZ2ghW5zja0tDAEieGocJC6R2GiczyexF+zntveuNFpVomT04eyrQD7uk6wxJ4V
 SjqxjQl93Sqm2vbMuUkxfqrBQenZ8da2QIt2DlEw/o0zOCfFcfdp0mnnveqKTGp55QguIb81NZFkX
 fKfXape3hrGyWIEOzf+cr4oz2JTDVaE6PhPUCCUuqyQE+TBBNwOa6wDx6ENy8nyuFzQkRXqKZwm4h
 yYsX19Cg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSNf-00Bmfh-PW
 for linux-amlogic@lists.infradead.org; Fri, 14 May 2021 07:37:09 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1936671wmc.1
 for <linux-amlogic@lists.infradead.org>; Fri, 14 May 2021 00:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xie40h+gZ1kzYUn1rROBwrR8QVBZ1vuhKr3GMAIK+Q8=;
 b=TgVhJZN35mBTuD+cC15AfqK8ykz9udZlYfRFTLu9xXjgyLVHyoxCmmiA2XQ6mn7GQ6
 8+k32KSLVWn4LMs3+3ZnbRxeSb1X9Nzo8HyoPuP1zJTCmBiS54FMI256xNZ4YaJP9Unb
 2OdJkpT/f1RYZk3iDJlRqKDJMWgFUjS5D838OhtG72eqq0XV8ZXuv1dWpV4S/gl5hO9l
 y0KU5idVxel5dpb6LLKxO6bckYUiVW0kewFbnWGdNZJ9ak9yXUZZbO+A82/eU08EzFHB
 fXQ5B3Pwf2zcsm6kensIlmiSLxGwtAEBDtCtbKdpU7QfgslEXBqmiWDeTPwmrp5JNoiE
 BaVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Xie40h+gZ1kzYUn1rROBwrR8QVBZ1vuhKr3GMAIK+Q8=;
 b=KRspp9bD5QJ6SMPK/fDqfKupgzgdo88GJ+nDy8iZxorRu0ghsJFTeJ+D+rMQ+xXK2s
 DPUY4dFw57EF1Tg9t+LSUlIGcfejmo+/F7nooF/yHDstbY37MfsuMrE1IId7yGOgANuB
 NyB2+nhgbi3IfE//pUzdtk07BFOuDuBsYAKKPIBXf5S3MUp48sH2shc+n9vzYqZzYH+L
 tiQAoyfgn2RlCrUQqkQ5VO0dQOCzhoHo8flkUPngWygsBGL5GylyK71ZdWyitk6Awh2H
 jlUoo4k9VKkBMP/d4uszvQCx85YFpIb8MPW3sbBLSGfwNLONfX97EwJOgnJNnsDBYFuc
 jckg==
X-Gm-Message-State: AOAM530yAMwwqbJqeX4fj8rVHfxo95RONc11cVin3qdZRoSNGkgQJpBJ
 04OifCJN0r/XYxySUcq2D/eVGA==
X-Google-Smtp-Source: ABdhPJwmhFrIvmqlONGCF4CpJDAkVPbQ35AP7JfhIb8MDmNU4+MHO5abZDYy/w/+WsNn4AWmn99G0A==
X-Received: by 2002:a1c:20d2:: with SMTP id g201mr8102333wmg.48.1620977825427; 
 Fri, 14 May 2021 00:37:05 -0700 (PDT)
Received: from [172.20.10.7] ([37.164.52.111])
 by smtp.gmail.com with ESMTPSA id c14sm5664839wrt.77.2021.05.14.00.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 00:37:04 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: ARM/Amlogic SoCs: add Neil as primary
 maintainer
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, soc@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210511190054.26300-1-khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <45188686-7fc2-e48f-e249-0483431e9d46@baylibre.com>
Date: Fri, 14 May 2021 09:37:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210511190054.26300-1-khilman@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_003707_911944_0448EF1A 
X-CRM114-Status: GOOD (  19.44  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210514073707.Z3f8kdPmbBsn-wL34F9vWNq06w2azwu2azvuUOcYpfY@z>

Hi Kevin,

On 11/05/2021 21:00, Kevin Hilman wrote:
> Add Neil as primary maintainer for the Amlogic family of Arm SoCs.  I
> will now act as co-maintainer.
> 
> Neil is already doing lots of the reviewing, testing and behind the
> scenes support for users of the upstream kernel on these SoCs, so this
> is just to formalize the current state of affairs.
> 
> Thanks Neil for all of your efforts, and keep up the great work!
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd7aff0c120f..1f64aa7de84d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1618,8 +1618,8 @@ F:	Documentation/devicetree/bindings/sound/amlogic*
>  F:	sound/soc/meson/
>  
>  ARM/Amlogic Meson SoC support
> +M:	Neil Armstrong <narmstrong@baylibre.com>
>  M:	Kevin Hilman <khilman@baylibre.com>
> -R:	Neil Armstrong <narmstrong@baylibre.com>
>  R:	Jerome Brunet <jbrunet@baylibre.com>
>  R:	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for your trust, I'll do my best to continue maintaining the Amlogic Linux SoC drivers & DT !

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
