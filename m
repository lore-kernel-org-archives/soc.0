Return-Path: <SRS0=yZUZ=VL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50872C433F5
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 10:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 16879C385B0; Tue,  3 May 2022 10:46:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D735EC385A9;
	Tue,  3 May 2022 10:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D735EC385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f180.google.com ([209.85.128.180]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MFsER-1ncGaR2PnD-00HRnP; Tue, 03 May 2022 12:46:04 +0200
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ec42eae76bso174923887b3.10;
        Tue, 03 May 2022 03:46:04 -0700 (PDT)
X-Gm-Message-State: AOAM531CKYK/CJJwbxd+jXXEh2GqGBDR8hclVUvtZYC7JVPiw6Rp+SuQ
	oDE4jjWRQsWSCw0eOGOIi8wCTCWRT53n6e73R9k=
X-Google-Smtp-Source: ABdhPJylICN3Lkv4MnajtKZ/mtz5v98V10dI0vpMrO0w3cw4ngaYj64jqdkCQYAkS/F2fDxRL5svru9bENy/YJPD9Ww=
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr14878150ywf.347.1651574763350; Tue, 03
 May 2022 03:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220502204050.88316-1-nick.hawkins@hpe.com> <20220502204050.88316-7-nick.hawkins@hpe.com>
In-Reply-To: <20220502204050.88316-7-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 3 May 2022 12:45:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2rzmVrpnf2r73iXB=T06OMOsgwyq1i8z7swuOW-q88eQ@mail.gmail.com>
Message-ID: <CAK8P3a2rzmVrpnf2r73iXB=T06OMOsgwyq1i8z7swuOW-q88eQ@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] ARM: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, nick@hpe.com, Joel Stanley <joel@jms.id.au>, 
	Arnd Bergmann <arnd@arndb.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:R6nF/Wiz/7c9DrRz3Zj/0igV4cp71zWjWaEMpEHSpotNo3+xYdF
 v/C4bLmXecrmRzfR39cPGHy3u3haDBfqU/GBdVAGGy3+azW8YtdFu+VQvor08mNzdyzuIRN
 Ocg0M3H1ehpGBbbAcfMCsQOUZm/rOAAU3uxMMrHJJ2Dq0tBHjMc/TMK2av2FND4B1m69BBl
 OheN4aRNJVfdnIVq1utpw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+6KEdY6qs9o=:I3xNV8HA4uLdXjlw5I3Y1w
 2pODTz6dmX+e6ycINbsRvMAmUBlryvHv2AFmTgRUKB+jZnXwQQtpfEf6bXIyzwvwDMSK+c0Oj
 5W4NK/bKpvxQSYJWcsy71eHJa26uRo0iJxxRhHxMwZ2NwjxZMI6oiGYcmQ6Fi/gduRSQ8v4Fq
 4xnXX++0Lx9ZKgAZCysFO1Qmq/m7PMp3mHUZaz4qzW8AFd+TdE08l4ctUaZqfhDGFGZrY8nGp
 yB2eGboS3H4vxonhifWC2gPddiP+rHjyPnkCDeXIUofum+L2ATXeohB//QPkw1xC5rhpLG8Sr
 etYgYREUxti+o73pMy8W6ILJ+Delfw4rHPgEuhK6vIVOcFVs1QoRBEqKUK/SvEqYTRB1n6KIK
 w8Z/9g5ERHjT1S2lbcw455Z0AkReUvmk3Go8ctED8ymjGZLdHahlilm10pvMh1gDXV8oRO52F
 b+MmmPWtv1hE7rBccclN4JpIakAA9IQp6mvQxFXFw+TWNpqzJhctLxwcOI2sIMKosjtfoyLSJ
 fR7tlpTsCXc/03OFcsgtcQJR7vUB/WqUE5T9v69g01OEXhbqdNBeC+tTcB0fRm3yK8yaxjQ15
 zhQh0sbBibLzX4X8wWC5048TQljD/wgzXPMp1Tl4BE6cOqzLi90jXq2M7z9o7NZP7XYMUfiF6
 gnv5GOaRAI6Pi6IiX2TrkvcqgscEngCxsHBNWwqu4KZfrboVDPGRQn1iRJwk6ZZ4hFGkW+tWQ
 mY+I/xFqu2z8BRCOkxDi7reZpIzJffWcK+K4eZ3XZ0KzyEVArzVbFnlgczTRO1Dy0BVlMGk14
 zyn07DpzkEGEHt0PkZjKMxxvJZOTZdw65zx0OpzwO4WxwMzYpQ=

On Mon, May 2, 2022 at 10:40 PM <nick.hawkins@hpe.com> wrote:

> --- /dev/null
> +++ b/arch/arm/boot/dts/hpe-bmc-dl360gen10.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE DL360Gen10
> + */
> +
> +/include/ "hpe-gxp.dtsi"
> +
> +/ {
> +       #address-cells = <1>;
> +       #size-cells = <1>;
> +       compatible = "hpe,gxp-dl360gen10","hpe,gxp";
> +       model = "Hewlett Packard Enterprise ProLiant dl360 Gen10";
> +};

In the board specific file, you normally have "aliases", "chosen" and "memory"
nodes that define e.g. which uart is used for the console.

> diff --git a/arch/arm/boot/dts/hpe-gxp.dtsi b/arch/arm/boot/dts/hpe-gxp.dtsi
> new file mode 100644
> index 000000000000..7a99e174e4b3
> --- /dev/null
> +++ b/arch/arm/boot/dts/hpe-gxp.dtsi
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE GXP
> + */
> +
> +/dts-v1/;
> +/ {
> +       model = "Hewlett Packard Enterprise GXP BMC";
> +       compatible = "hpe,gxp", "hpe,gxp-dl360gen10";

I think "hpe,gxp-dl360gen10" is misplaced here, if that is the identifier
of a particular machine rather than the SoC.

> +       memory@40000000 {
> +               device_type = "memory";
> +               reg = <0x40000000 0x20000000>;
> +       };

If the memory is outside of the SoC, it should not be here.

> +       axi {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges;
> +               dma-ranges;
> +
> +               L2: cache-controller@b0040000 {
> +                       compatible = "arm,pl310-cache";
> +                       reg = <0xb0040000 0xFFC>;
> +                       cache-unified;
> +                       cache-level = <2>;
> +               };

The length of the register area looks wrong, this is usually the full
4KB area, rather than leaving out the last four bytes.

        Arnd
