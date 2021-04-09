Return-Path: <SRS0=2hmS=JG=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0879C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 18:10:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A3576115C; Fri,  9 Apr 2021 18:10:32 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13916115B
	for <soc@kernel.org>; Fri,  9 Apr 2021 18:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E13916115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id y204so1973858wmg.2
        for <soc@kernel.org>; Fri, 09 Apr 2021 11:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:in-reply-to:references:date:message-id
         :mime-version;
        bh=NCZ0mYxm01Y6BQQ4DD36UoK5wirRF8QQOJoKGAXkKTk=;
        b=ar1Zx3c1rW8q67/2QqTbpdVGKfniQ6hAquhWNWYX0UDyP9xjygQePIsPRL+SSoZXyA
         7/3YhAuLzi1JaA6ZfDnFMs1gtaSDAWFTLdW5n/QInLt1zVCcO/GHZLoYUEIVaa4ykIdA
         ucJEr/xvByEmqRbS1vsmrQeXUCcxu3i672jzgIZnSTBZnp55F6XhQDkOR1dDZns+ZhdU
         sfCrfaN1OuD4E1yepOBZlGnTQXobxN5W6c8/yrLMyQxwlLT7LMU29/xmEMcw6W0FDPQa
         29eA0o8iRGdInjpqivK03pvHN2rH73XDVHt+hpRZsu7IH/mxwIiJTyvCQcpGwfy8KQkI
         RyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
         :message-id:mime-version;
        bh=NCZ0mYxm01Y6BQQ4DD36UoK5wirRF8QQOJoKGAXkKTk=;
        b=V7z5z564OynN/58bE3P6OhIBAeWP9epPKTXl7XqNpe7EkJcplU8/d6REgwXVoEDSOZ
         vYRp+PpnqLVE3aTqHyf+YAwzMGpRhoQJdhEaVhRKNGzeCCX7CULebkgb2T7iCI8/sdc2
         mti3vX9r+mlEIS0QmawBe73/fAP0HGDpfJhC8kK16HA/7X8WV9v+JikFNR5c0+R5rKI5
         4kAPw4qSQSpwVK4S+jyYx1SZO/F75g+NjAiEbJGG141c+aTnuEOidVe8X1tzvuVEPHLP
         rD2Pw/XywocbG8Z253JXw+/o9dh1PnZnrV09nMxnZVST4tgBXK1JlaSO0SQKM7mnbHRx
         omCg==
X-Gm-Message-State: AOAM530DWDsq/GriGClhCwGcsiounnTLcf6+yKAwzSMS+9ibIWCEoz9V
	h3Zaj+z3i3/seTIrBur2fdwSx6ey7XPwWeE9
X-Google-Smtp-Source: ABdhPJwOHbbgqVNyb5kiH2aXj+nlYbV4MK6sHLNhY6ffGKTo4wfH+1xpR2QDE36PvmUypSyEmf3DSQ==
X-Received: by 2002:a7b:c20c:: with SMTP id x12mr715878wmi.51.1617991829376;
        Fri, 09 Apr 2021 11:10:29 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id w22sm4999135wmc.13.2021.04.09.11.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:10:28 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org, arm@kernel.org,
 Christian Hewitt <chewitt@libreelec.tv>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic updates for v5.13
In-Reply-To: <161789493793.1630479.15784072871445378505.b4-ty@arndb.de>
References: <7h5z10mjpp.fsf@baylibre.com>
 <161789493793.1630479.15784072871445378505.b4-ty@arndb.de>
Date: Fri, 09 Apr 2021 11:10:26 -0700
Message-ID: <7h1rbjib1p.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

[ + Christian ]

Arnd Bergmann <arnd@kernel.org> writes:

> From: Arnd Bergmann <arnd@arndb.de>
>
> On Mon, 05 Apr 2021 15:48:18 -0700, Kevin Hilman wrote:
>> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
>> 
>>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)
>> 
>> are available in the Git repository at:
>> 
>>   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-dt64
>> 
>> [...]
>
> Merged into arm/dt, thanks!
>
> Can you have a look at these added warnings from 'make dtbs_check W=1'?

Yes, we'll have a look and send a follow-up set of fixes.

Kevin

> amlogic/meson-gxl-s905d-mecool-kii-pro.dts:31.19-42.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> amlogic/meson-gxl-s905d-mecool-kii-pro.dts:37.12-41.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
> amlogic/meson-gxm-mecool-kiii-pro.dts:36.19-47.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> amlogic/meson-gxm-mecool-kiii-pro.dts:42.12-46.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
> amlogic/meson-gxm-minix-neo-u9h.dts:42.19-53.4: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
> amlogic/meson-gxm-minix-neo-u9h.dts:48.12-52.5: Warning (unit_address_vs_reg): /gpio-keys-polled/button@0: node has a unit name, but no reg or ranges property
> amlogic/meson-gxl-s805x-p241.dt.yaml: serial@84c0: 'uart-has-rtscts' does not match any of the regexes: 'pinctrl-[0-9]+' amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: audio-controller@5400:
> 'sound-name-prefix' does not match any of the regexes: 'pinctrl-[0-9]+' amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml:
> audio-controller@c8832000: 'AVDD-supply', 'sound-name-prefix' do not match any f the regexes: 'pinctrl-[0-9]+'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clock-names: ['lpo'] is too short
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clock-names:0: 'txco' was expected
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bluetooth: clocks: [[23]] is too short
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000: eth-phy-mux: {'type': 'object'} is not allowed for {'compatible': ['mdio-mux-mmioreg', 'mdio-mux'], '#address-cells': [[1]], '#size-cells': [[0]], 'reg': [[0, 1372, 0, 4]], 'mux-mask': [[4294967295]], 'mdio-parent-bus': [[35]], 'mdio@e40908ff': {'reg': [[3825797375]], '#address-cells': [[1]], '#size-cells': [[0]], 'ethernet-phy@8': {'compatible': ['ethernet-phy-id0181.4400'], 'interrupts': [[0, 9, 4]], 'reg': [[8]], 'max-speed': [[100]], 'phandle': [[36]]}}, 'mdio@2009087f': {'reg': [[537462911]], '#address-cells': [[1]], '#size-cells': [[0]]}}
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: bus@c8834000: rng: {'type': 'object'} is not allowed for {'compatible': ['amlogic,meson-rng'], 'reg': [[0, 0, 0, 4]], 'clocks': [[3, 25]], 'clock-names': ['core']}
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: hdmi-tx@c883a000: 'sound-name-prefix' does not match any of the regexes: pinctrl-[0-9]+'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: ir@580: linux,rc-map-name:0: 'rc-mecool-kii-pro' is not one of ['rc-adstech-dvb-t-ci', 'rc-alink-dtu-m', 'rc-anysee', 'rc-apac-viewcomp',..., 'rc-zx-irdec']
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: serial@84c0: 'bluetooth', 'uart-has-rtscts' do not match any of the regexes:
> 'pinctrl-0-9]+'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not atch any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: 'clocks' is a dependency of 'assigned-clocks'
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: audio-routing: ['AU2 INL', 'ACODEC LOLP', 'AU2 INR', 'ACODEC LORP', AU2 INL', 'ACODEC LOLN', 'AU2 INR', 'ACODEC LORN', 'Lineout', 'AU2 OUTL', 'Lineout', 'AU2 OUTR'] is too long
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0: [63, 0, 0] is too long
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0:1: missing phandle tag in 0
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-0:sound-dai:0:2: missing phandle tag in 0
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0: [63, 0, 1] is too long
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0:1: missing phandle tag in 0
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: sound: dai-link-1:sound-dai:0:2: missing phandle tag in 1
> amlogic/meson-gxl-s905d-mecool-kii-pro.dt.yaml: vpu@d0100000: 'amlogic,canvas' does not match any of the regexes: 'pinctrl-[0-9]+'
>
> merge commit: aa1e345ade42ba90ab868750acab27a360998af1
>
>        Arnd
