Return-Path: <SRS0=7cRl=KM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22185C433B4
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 23:46:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E1183610A8; Mon, 17 May 2021 23:46:33 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD02F60FD7
	for <soc@kernel.org>; Mon, 17 May 2021 23:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD02F60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lj1-f173.google.com with SMTP id p20so9305148ljj.8
        for <soc@kernel.org>; Mon, 17 May 2021 16:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bVEEpIXI/Y5CtVnRyxBQ3wjVOQ3Vlf0v5827celIsKo=;
        b=nMBqhSpQSNGHZUcZtE4vR9rjwvtGJDraTV1gmLxW1M85AMzZj0UzVm74oTMMebnUXQ
         WUBsl1vtJj18d0zmOJ/Ho4JD+GGT/lxzvAgQM3kQLTTz7THuWCxwFpSINd+DoeUIATeE
         lDNarF+k4qT0/7akXNOMqzx4n8ZM0zvQcuV5vwpUPzIcTtX2PgJZpHhermsa/S5P/wH3
         GiM4XuG5hqEo/bN9easQvihiBQ4ax8Nxh1K6JcWyJ01fE8YTj1yW1GnYxAx7EeB4ogfa
         zgfKczId40OPPuzodgNZt66+dl1nVRCGQuj6m69KMDcKLhgejMwCl+gTOL9cWO4YBriN
         /emg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bVEEpIXI/Y5CtVnRyxBQ3wjVOQ3Vlf0v5827celIsKo=;
        b=JPl9azIXRijNZ+xwGV7YcncN01oIKf5kcVD2tVc+5Giv7bcT7WRcuOAGGz12TYh5iM
         nR+rrUEaYpU7K1I4ICFlRYyTxwVlSdqgDt0lnZ//gzvZontDq8o2jCHffmYjOtfKS1QP
         7G1J81HmJOmM88f83AJSLx60hsfcWBHMPxyCUIGRZFzr5G2RM4HTnzHr9Gh28SrkM2ro
         EdSM6FpXV3eZw6DtDv8TGawr5suo6LIHe/4KDc75/SEbXlK4Yj9WR9Smds7VmDF3Npcy
         oIzvcIiAvdCohPbodsyOTYFyP+OO1kWsIFzg9MVVQ76MshaROOLoEmrt6KWH3Clk3DmT
         EUjg==
X-Gm-Message-State: AOAM531aY4s9FjtJndtObvMbh0qV2eVdCYyPa4e8/aeOHElMmG3IqYCM
	EDXiL4Jf1H1GY9bLmfx5KJYzpdK6DF+32VljlCZFzQ==
X-Google-Smtp-Source: ABdhPJzt0OHOWOBh2f/7ip9SW9OpdwvzwD16NBHIqmNMbaI9JWSwPO/iXIy/XDXuqsOkAcaOFtHYons8j7cCqxQgO1Y=
X-Received: by 2002:a2e:90c7:: with SMTP id o7mr1613773ljg.368.1621295192148;
 Mon, 17 May 2021 16:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210517193205.691147-1-clabbe@baylibre.com> <20210517193205.691147-5-clabbe@baylibre.com>
In-Reply-To: <20210517193205.691147-5-clabbe@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 May 2021 01:46:20 +0200
Message-ID: <CACRpkdY3c4uvo1zbEgNW0meF-4P8be_nmoOEQAHP5V+GXgoG=A@mail.gmail.com>
Subject: Re: [PATCH 4/5] ARM: gemini: add device tree for edimax NS2502
To: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	SoC Team <soc@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Corentin,

this is looking nice! Just one thing:

On Mon, May 17, 2021 at 9:32 PM Corentin Labbe <clabbe@baylibre.com> wrote:

> The edimax NS2502 is a NAS box running a SL3516 SoC.
>
> Signed-off-by: Corentin Labbe <clabbe@baylibre.com>

> +&flash {
> +       status = "okay";
> +       /* 8MB of flash */
> +       reg = <0x30000000 0x00800000>;

No pin control setting? I guess it may work but this doesn't hurt
(I think):

    pinctrl-names = "enabled", "disabled";
    pinctrl-0 = <&pflash_default_pins>;
    pinctrl-1 = <&pflash_disabled_pins>;

> +       partitions {
> +               compatible = "fixed-partitions";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +
> +               partition@0 {
> +                       label = "RedBoot";
> +                       reg = <0x00000000 0x00020000>;
> +                       read-only;
> +               };
> +               partition@20000 {
> +                       label = "kernel";
> +                       reg = <0x00020000 0x00700000>;
> +               };
> +               partition@720000 {
> +                       label = "VCTL";
> +                       reg = <0x00720000 0x00020000>;
> +                       read-only;
> +               };
> +               partition@740000 {
> +                       label = "CurConf";
> +                       reg = <0x00740000 0x000a0000>;
> +                       read-only;
> +               };
> +               partition@7e0000 {
> +                       label = "FIS";
> +                       reg = <0x007e0000 0x00010000>;
> +                       read-only;
> +               };
> +       };
> +};

Is the FIS broken since you hardcode the partitions?

Doesn't this work:

partitions {
    compatible = "redboot-fis";
    /* Eraseblock at 0x7e0000 */
    fis-index-block = <0xfc>;
};

(Needs CONFIG_MTD_REDBOOT_PARTS)

Yours,
Linus Walleij
