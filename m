Return-Path: <SRS0=XyzI=JZ=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CD3C48260
	for <soc@archiver.kernel.org>; Fri, 16 Feb 2024 11:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BC6FAC43609; Fri, 16 Feb 2024 11:00:23 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B2EB3C433C7;
	Fri, 16 Feb 2024 11:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B2EB3C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3d82926ed2so76062266b.0;
        Fri, 16 Feb 2024 03:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708081220; x=1708686020; darn=kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=nclE5N36t4X50lTZWeaKc7lQIaLwi4jRfiGkqjn+0l93/VL3Jj0NzoC4+algiIGfEr
         T5OhxiZ11UudDSA70IOYhZkhq6OtuYYhPMcMItaRUBLhtWL2ba4UrYMe++Tdztgm41jU
         H2uWpJAlibHNPLXpbGEgddukDLCnSoNPQPiQI+aEKBfGfKxZS28McsYf2Y73uMtA3ZOW
         t4dkpEtLQbT/eX3ZnZwSlLqe0m129egg70CmNbX2HonRkeuKeKXLkQuaDSQVaYH3rdFg
         j2aBoIVt3p6X3duKGvvsmroD5pxsnkbn1k4xXZC0/+vGzevuxcizhgwCG4iBAvdGfzDB
         lbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708081220; x=1708686020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLhCxXeXfTy0oKV1PZq76pGTpwbsrb7RXVp5Ag35IfA=;
        b=uKBuQ+Tpt1FLALEwXqsokpXy0MKWrGGj1EleZts13uAbpzhVn4uB0DFye0c4fDzHNs
         BpZVL4GVun+UiLyqsyCbfEYtcZYUBzj0DPC0D22EjCII/YRyeC54Wsr2dW0qicwBfLyT
         9MkjN84oyJGm45qtAQLWccAlcpI3zucUQhByrGX0x5pq3jW9uo6XQWi3fqBtnoaKRPpj
         956wUHPucoe1tQzVAki7DICfF1YCYe9OR41D3xzkOmmNlDhc1N3SvHSIrtYmPjJ1mNw+
         75XQ1Z1+YS5qMW90amIkEl54TrnrFlrL6b9BOlsaKINgm5GTkupfmZx465n9VGM9CPTo
         VU9g==
X-Forwarded-Encrypted: i=1; AJvYcCXKEZtVl87MzgeHN5szDZXfHK0nelb7zaGkJIvFWMXOdq+NMGMXHSdTraQF6WR3PZfqvGvpAMG5BSF772fn8X0X6vVILh1bugDvLd5Ue694YnBdV3XLbZYNBhdb+gBIff1xt8lvI98aWrRp1s7DUx3lKihjhabqzoIQqZELa7Gd9uyvqEHoiUBsPV5tqvhbHa4YC5EyECZSO39KZIN/2aC8jEzh1CA+moa3UveASo3KN0feLF1lKsS9pQmAXyt66KSX9E5lJlIj045vf91Uyw==
X-Gm-Message-State: AOJu0YzcusDEEN1mTtzD8ZtKGIOZ6U4b1h4JNtEhZP1zj+K9gWQR9bDe
	OxHQkeqkclAHPRaHUgJT4hSKaxbEB1Pv+PcRZUvcOEGZqh+RGY0/KRMDxzYB
X-Google-Smtp-Source: AGHT+IGJg1U3l1s0cZ7SNrJJLULfB++IrJsj8RGS0gGWbyw09mvwxmMXattq7dTy3fEu4mQVbz3vaQ==
X-Received: by 2002:a17:906:46da:b0:a3c:f6dc:ea46 with SMTP id k26-20020a17090646da00b00a3cf6dcea46mr3038631ejs.49.1708081220098;
        Fri, 16 Feb 2024 03:00:20 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3df003b6a9sm219235ejc.119.2024.02.16.03.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:00:19 -0800 (PST)
Content-Type: multipart/signed;
 boundary=3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 16 Feb 2024 12:00:18 +0100
Message-Id: <CZ6G9AYXMMHZ.3ABQKCJUHPSLU@gmail.com>
Cc: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
 <openbmc@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-omap@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-renesas-soc@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 2/6] arm: dts: Fix dtc interrupt_provider warnings
From: "Thierry Reding" <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: "Rob Herring" <robh@kernel.org>, <soc@kernel.org>, "Shawn Guo"
 <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Fabio Estevam"
 <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>, "Rob Herring"
 <robh+dt@kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Tsahee Zidenberg" <tsahee@annapurnalabs.com>, "Antoine Tenart"
 <atenart@kernel.org>, "Joel Stanley" <joel@jms.id.au>, "Andrew Jeffery"
 <andrew@codeconstruct.com.au>, "Ray Jui" <rjui@broadcom.com>, "Scott
 Branden" <sbranden@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Andrew Lunn" <andrew@lunn.ch>,
 "Gregory Clement" <gregory.clement@bootlin.com>, "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?=
 <j.neuschaefer@gmx.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Stefan
 Agner" <stefan@agner.ch>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, "Tony Lindgren"
 <tony@atomide.com>, "Chanho Min" <chanho.min@lge.com>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Linus
 Walleij" <linusw@kernel.org>, "Imre Kaloz" <kaloz@openwrt.org>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier"
 <nicolas@fjasle.eu>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-2-f2dee1292525@kernel.org>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Feb 13, 2024 at 8:34 PM CET, Rob Herring wrote:
[...]
>  arch/arm/boot/dts/nvidia/tegra30-apalis-v1.1.dtsi      |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-apalis.dtsi           |  1 -
>  arch/arm/boot/dts/nvidia/tegra30-colibri.dtsi          |  1 -
[...]

Acked-by: Thierry Reding <treding@nvidia.com>

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXPQEMACgkQ3SOs138+
s6F44g/+KPT4RF0vNadKSFIV9/iihK84gvvjHc/8S/+Ks+sJw7//4Zws8JtsGdab
UvvmQ8R5uIrvLpONlnmdl8cjWpnA3OV1VMJRgXeYIR/kKZxuoiZF03R8COiGQvfJ
Cf4mq2od1sc4OOIFxTV0KJfp6XbmI09stW6zm5wk1F5CjbnMD0TTgxQhEAsOLfum
aDJefFKp6T8QOlCQhCeYYnXwUIBdoYs7z+SRXBuJWJvgwdPMnyc4M7/5PtW57UXZ
Vn2Hri2+u9imbcIzSUkrPLev1Kg5sWTF7CSICzmA+jTvHQUAZFQQMyjrGFkFTeI/
g/J4ljpwRqBlhXRx5ioNbGqYmptZvuljjH6bT8hDzTRNPdfvZfKJSX2+wWb5+kM7
/CdKfwORAUgMMqqABa4mSxHys/mmyeLJ2idQj/buql4pC7EpgD7SZRadqnaAkD/S
3zxA6VBVq4Jt+6X3kjgGySa0tUyBMSWydLjH/TTkcZtwu8iEEggp7MxiYA2wJhne
Pf5VjnhX5nLnPJuJn/Av5GHF1jvsrt9lENJTmpLFZIzxhxWrPntynrvfbpAV50e3
eWqEDRu7eWFatZNZTrnRhmOHcGO197HIErp20X4PVISOY0uolzuiHFpjQBCUGQdV
1xaTRZPbjaTB4pcqWNxi+mI4M6jIyDJc6COrC2G9t5GYMcbE6W4=
=HY7z
-----END PGP SIGNATURE-----

--3f4d0b1f359aea3b19397b20b790a1177690846d9dafd4c758ed6e868b5b--
