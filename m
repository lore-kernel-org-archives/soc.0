Return-Path: <SRS0=kpNk=JG=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47FEC433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 03:37:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A599C611AD; Fri,  9 Apr 2021 03:37:25 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7010761175;
	Fri,  9 Apr 2021 03:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7010761175
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f49.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so2468408pjg.5;
        Thu, 08 Apr 2021 20:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AjoDWdy7uigSAOeBTzYfInfamNFP4DVUXaPENdJokEw=;
        b=rD4fSwMmMCEX0HS4ejc3Hb6gpSc2m4ArhR6ghHvQgmR1y8U0MmfK8RZt3uZHt+Sz9u
         xBUGni9BVfero8kyHmkusbHh0b9QdGhDYAkmO6TSq9uQTe2afYbEecnlOtUBpbBzgOWp
         CLwdNmFQoATJ5HmsU5Zh+8f2KkEvNJyLNL0RErVrwHDGYCrcnI4V4Fy2IN+WuAUbrALN
         oPClTLBaOY7HLrZNvHdOfMLKxVLwqqDTzTaFoD8gixhoa2NGBpVRWucKJX+RloxXqMKK
         v6PBS6sv1ZDIlLMMva3oNTf6BM7BUn/WgRZaYvsAACq5F02VPDSd/n30FEO045W/x4qF
         PpJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AjoDWdy7uigSAOeBTzYfInfamNFP4DVUXaPENdJokEw=;
        b=ONosUGXBJ2CKmYhJy3wEGAM0pVTn7Qpsq/KiH6z8EOExPFPTQnootmN7AxxGP1IT0X
         rSfEfjNpf5iuqPeQXIL0W2poISM8dgge1zpiQIhjk2JCHAC5Lq/BebfQfqhONMqPS3/J
         eJ2cLfCyDelTaranTNZiyxiz2nPCpia087KBWeQPuGA2R+GUVwo9Qs7w7Dh2zL/qRVq+
         WHOZvzw8P4ckG4LHqX/7NhajkkAeCJzcOVcOdeJAwfRYs4ji1qjG7Grvs+y8Ok83Y5im
         Myy+X5txICBY9zJTHyjXG1vdnEcB0rnsEryFRvrPxTalG+3r+6Ws2+waMg2PSYUwsM3o
         YCXw==
X-Gm-Message-State: AOAM533sjhm2fDwUAPTrkZToqYFa8MOtn1ZwW3LDbuas+Pr9JFu7mg2K
	Dnp15MgQBQbbBRdfe6RFqjldmDfHC/w=
X-Google-Smtp-Source: ABdhPJy0STsNx2IrHuB6ju6EIrKalhe8t5PRpma4+erIvzt8MdGCtvZkjE7bziGAHp+e6K3DmVaSkQ==
X-Received: by 2002:a17:902:a716:b029:e8:ba45:ea0f with SMTP id w22-20020a170902a716b02900e8ba45ea0fmr11062085plq.63.1617939444981;
        Thu, 08 Apr 2021 20:37:24 -0700 (PDT)
Received: from [10.230.29.202] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v126sm711637pfv.138.2021.04.08.20.37.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Apr 2021 20:37:24 -0700 (PDT)
Subject: Re: New 'make dtbs_check W=1' warnings
To: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
List-Id: <soc.lore.kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, SoC Team <soc@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Gregory Clement <gregory.clement@bootlin.com>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <632cbdec-e477-212c-f5a8-81151915fdeb@gmail.com>
Date: Thu, 8 Apr 2021 20:37:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/8/2021 8:08 AM, Arnd Bergmann wrote:
> Greetings to all Arm platform maintainers,
> 
> I've just gone through the DT merges I've received so far and, with a
> little help from Rob,
> managed to run 'make dtbs_check W=1' before and after, to see what
> warnings we get.
> The good news is that the number of warnings is going down, but
> unfortunately there
> is still an unmanageable amount of remaining warnings, and some new
> ones crept in.
> 
> I'm still working on my tooling for this, to catch these better, but
> ideally I think we should
> try to not introduce new warnings. I think some platforms are already
> clean, and I did
> not see any new warnings for mvebu, samsung and broadcom. There were a lot of
> warnings from .dtsi files, and I probably did an incomplete job at
> deduplicating those.

There are definitively a ton of warnings for Broacom DTS files, a number
of those warnings exist because the bindings were not converted to YAML.
Rafal, do you think you could help me with taking care of the
BCM5301X/4908 warnings?
-- 
Florian
