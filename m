Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A22C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 19:28:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8DC3608FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 19:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8DC3608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6x6XVjjy6zxZGcJEBJcKXhPcdKkRgy1rcRX5nhFn0oQ=; b=JPNP6EPoxvhvLNztMlCNc12Ud
	sCSK0+rr0SaqQlSTVIkxo2hmIQRS2RTZ4kY9TMWrQHJffrlBvygrj3FXE6KiwmmpIk2rwn6Y8sHr5
	c7rP/djEKPQcujKJjyS4Exf0UV7W8vmugEqfFHYQ3Pe8lOKbEY0YKlKt3fplstsU4rR2lEylvM+mq
	AkA7+zdFPSXWYNI2qMML5D/KmMUrEjpoqgntX6BUuS4KzXQq3Eay4YUThxBF3qIItQcQqa9tAH1XJ
	NIMSzvAi72QQQfm+9t1mRclNNbwUbQiG84Rs4BgWEVSaxKF0gek4emvZ0Eqo+QzOwRs7UkspxO3FY
	ge6e+oCjw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUaHX-0095p4-Py; Thu, 08 Apr 2021 19:25:36 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUaHT-0095oA-AZ
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 19:25:33 +0000
Received: from mail-wr1-f69.google.com ([209.85.221.69])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lUaHS-0002d9-7G
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 19:25:30 +0000
Received: by mail-wr1-f69.google.com with SMTP id o11so1399021wrc.4
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 12:25:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EW7d+9G4/kjjtpomgAZZU/CRnYFDop2X3n6Zj7v339I=;
 b=IVe9diW5oGdLwaEFiP8EuUtn8TEdeCNAiiDByGoDzF1W+mug6dt+IFhkc0liodUQ5L
 xcJzp6V1a6/b7zbAwungjl3akgGCgacKG8M14eg6cTcZEEoKphocvjcoVtU7R9FUxKlZ
 6/92YQEFBkFJktv6+R02trulIt0TtsSKVySbyCjWcvrohI44tdTASYm2bu/Xn+6sA8oP
 0QwWyk0RHAr3axRbSTdefIKz96uLTyspw7rRTa+Bv080nS7v3KcFNXzbTsKF1lgGmujm
 OyXWcvDOqepLq20cYrVF0hieNFYeHdmOIvUVBUWR5o2Yu7mJqMlONvenXr0v/Qah3ac2
 U1ew==
X-Gm-Message-State: AOAM533OnOXUetAToGEpzIOQIDFPfPGUG3vZeAE9aczrrHZx3CxcQ8P/
 qOVVVKROzCAJgbXxoXuP4rx+5SHYrEKyIHYsErWnsEiXU4aCKCqy7LI3nwbxoVQ1QUIWU3miSzp
 4NZKc54MgCpuXwWZAY/x0tGUcTn+wW2KpARlL66ghTqZBzH+1kmQL
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr14193191wru.0.1617909929799; 
 Thu, 08 Apr 2021 12:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3uC3t9Rn/hZil2QBwcuqL7F591JGwIex59HP2iZb5W4DsmO5gVtcusB8GA9Rzz/D/7bvgcg==
X-Received: by 2002:a5d:4f0e:: with SMTP id c14mr14193176wru.0.1617909929665; 
 Thu, 08 Apr 2021 12:25:29 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch.
 [188.155.192.147])
 by smtp.gmail.com with ESMTPSA id u17sm261604wmq.3.2021.04.08.12.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:25:29 -0700 (PDT)
Subject: Re: New 'make dtbs_check W=1' warnings
To: Arnd Bergmann <arnd@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>
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
 Gregory Clement <gregory.clement@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <70873555-ab01-feb0-536b-d4b60ac89768@canonical.com>
Date: Thu, 8 Apr 2021 21:25:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1L8rWpR5b66v6Su8-m7-scA0wZQr_g_4KnV4dnrky6ZA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_202531_470238_68EA556D 
X-CRM114-Status: GOOD (  25.66  )
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
Message-ID: <20210408192528.FAboMv0FRnkw7xCc0Tlv1mKL7ASoymK_UZikoNvpeqA@z>

On 08/04/2021 17:08, Arnd Bergmann wrote:
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
> 
> See below for the other platforms, and the new warnings that I found.
> If these are
> valid, please send a fixup before the merge window, and let me know if
> you have ideas
> for how we should handle these in the future.
> 
> For this merge window, I don't think any of them are show-stoppers (Rob, let me
> know if you disagree), but in the long run we may want to gradually enforce
> a rule about not merging changes that introduce any new warnings, in order to
> have a chance of cleaning up the existing ones.

+1 for such rule, although the best would be to get a report about new
warnings on posted patches or shortly after applying, e.g. via 0-day
kbuild robot.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
