Return-Path: <SRS0=3VtK=KJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 692C6C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 07:39:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3ADA611CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 May 2021 07:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3ADA611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BKwP0uE3oxNwLbIJsNenZnVMbVWnnagcXbj/noPlwBw=; b=HnVS8PsCkr5tGC9smLU7NGtio
	/3w7hcsduSxX9a6/7ibX8bl45sktL/mkadSaaRGhAcFJcezlHLdU4ngifs69mlsV81pwPt4RT1BSx
	ZP45r4Eu/6/Z3f4b9MgwBvNEcYPUGkH4xqECB3fawQxq7TI7lYI350Y9jls/emQHuOWxHidtjfFEz
	Eu5TFA6aJFsjitSbHubxjEDYmpidmy0OwHiAtRVTnq37spBZXuYNcKEMniu7/oL2Cf4mwOpGkTBLm
	Ts7G6407TDVSOHhxtF24bo7xCXvWZhqX58AmKdupN0DCmCK08rKV7ydqL/dl7nm9uWj9f1TFrvdKs
	YrqWax/4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhSNl-007Oid-Pr; Fri, 14 May 2021 07:37:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSNj-007Ohy-7l
 for linux-arm-kernel@desiato.infradead.org; Fri, 14 May 2021 07:37:11 +0000
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
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhSNf-00Bmfi-RM
 for linux-arm-kernel@lists.infradead.org; Fri, 14 May 2021 07:37:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id u133so4285493wmg.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 14 May 2021 00:37:06 -0700 (PDT)
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
 b=jFpdrYcJAB0ByxHQ/mrxHQgphoIVp3yPGo4v8xOQg/IfaxPTCbC55Ct8fCt6KFssdO
 Hu3SsZJNL8E/FrmlIRZc3aFJKJJEqCVCgW5pwbayq3z2T3pgM1kmtnce7V1i+eDRNda8
 IkuRp6WvL4y+l2Sc/3FDhqLeyUXwf4nbLP6masaaF8ZYlNJfWDt4lB++OXbU/TE71azA
 SuNLAtOoevyliwpoHHWW/aaa/F8y3XhfZBs0REQ5wF6RkL405BUcj41ohK20AhfkUKYS
 IqAV42EVS6XsOpw9yHSb3caLX3g/uVrgsyCMxoDsbpVq6gGFdRdBveZ0ewxCoEMoG5Yu
 5u3w==
X-Gm-Message-State: AOAM533TYIc3rMgDoN0YwdlcWsXKJoHXGJOzRj9zcGsyGIYbNzBfHbB/
 DoQpxn1EBtIMJU3zgXmHjVxQ9Q==
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
X-CRM114-CacheID: sfid-20210514_003707_917206_FE4DFD64 
X-CRM114-Status: GOOD (  21.03  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210514073707.6ifRNaeQCICtbNChfNkYNInHKKHQ22j-6bGqwfL_N8M@z>

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
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
