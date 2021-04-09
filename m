Return-Path: <SRS0=+Itf=JG=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B54C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 03:40:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9114C61055
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Apr 2021 03:40:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9114C61055
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pzSZcFHF5MlUHon/rbys+HzjtI9SmcQaA4zqwKC1uzg=; b=UjXcHduQuI7MP7EnAd2hYTZ4A
	0IfsTHr4sasGJGJ2XCcB7v8yiMVtqsHdhsWGs5k5nceppfrXxqoZ7XjxO3WGvKo7j1u82qDecmjrw
	U7yIBDqqn8U/7AaFtelHHfGNn7QTN/AQQGo5HGmgi3py3i1tcIZY6zhtzkVfizjTPyhjG/fOZwywk
	lm1xjyFuFUFdwk56hDM7javMeNojJ/yJIIEwpBTXLhZ2OhTEW/UH12oGpnPudFpVJtspzoRIxqs2K
	XF9f8W608pUxcoiJwhXsNC8/5IBh1xFho3uSqkDQCOxNegg+Sxi3GoWCKubjkydTWSsLaKVau06Rc
	o5fx8k+yg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUhyG-009sbv-BW; Fri, 09 Apr 2021 03:38:13 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUhxY-009sQE-8y
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Apr 2021 03:37:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso2488217pjh.2
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 20:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
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
 b=oRQCIvt1CFR9+dSdym7uX2UN2tGPoz8/B12Uzm1qLIyGwUyp1pYVVcJXIhqAA5ejSV
 tczP6GMXNEKqYmoTgW0asevn3M55tbfzp9TZ0oXZxxsvP1GNI8g6NzOFjCtdxetsaech
 88hbBpafE+fo1WISYQW/9FFwUGajILPRgtH8ngiTCt44o5fnUjOQDZ1LiG+vEwmuNmFl
 EiOlH2jjH9URq5Lhu44PYftC+G5iaNh3jKqvFePPXfecny3H92MLxksZ35nh3UQw3VfX
 ji57PgufocqM9PuRQ9gK+4cGfgbWXC3s9r4+G8BHUWFPhk0/2DFDXHKGj7OZIU0dD+ya
 LkWg==
X-Gm-Message-State: AOAM5307bm8GRapTDxGE3w8fcWW2rbgZ5aW6nQARYsvaQKX2uIl+ncEe
 QzzbQVBb+Sl4v2X81wvUOl8=
X-Google-Smtp-Source: ABdhPJy0STsNx2IrHuB6ju6EIrKalhe8t5PRpma4+erIvzt8MdGCtvZkjE7bziGAHp+e6K3DmVaSkQ==
X-Received: by 2002:a17:902:a716:b029:e8:ba45:ea0f with SMTP id
 w22-20020a170902a716b02900e8ba45ea0fmr11062085plq.63.1617939444981; 
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
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_043729_647507_B456997D 
X-CRM114-Status: GOOD (  17.56  )
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
Message-ID: <20210409033721.L5RgKaPAg4KO3ui5okysab5hTtrnThZrZ6PTgP8EiAA@z>



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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
