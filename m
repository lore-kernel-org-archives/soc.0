Return-Path: <SRS0=iIBJ=ZW=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54756C54EE9
	for <soc@archiver.kernel.org>; Mon, 19 Sep 2022 12:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25264C433B5; Mon, 19 Sep 2022 12:45:35 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DC3B7C433D6;
	Mon, 19 Sep 2022 12:45:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DC3B7C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id x29so1463935ljq.2;
        Mon, 19 Sep 2022 05:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VB/tVzHx542NdE3ovrJj8GJ9yV2C5QxKRxxJJKr/wSE=;
        b=GoYjKqW3LPVGsXOfI/pUio6P+JIU59CD2pCLwS0W/FYBLM4baxXIWRolx7Hf0v3fX9
         7cxpCfsNZHiN6bYGddf69RqPFbeX9blHPO/7EFHSoQ58mw2wqVkGOLCk9M2AK2V6D7UX
         tanohUtKfPf2YkMHb6JwyvIq1V/3irJakXKnKfqSMCmCF3k0ittPhw6Pj6r1VhOF5Bss
         YjB7iqteRd9ZRTJm33AlL9uXa4jlLo+5YlkVnLXOdDqS/9FnhOD/xZDdNQw0lTOTHHMy
         UHcDtH/TyybnUBdAUjrZj3Y7s974VSxZwl1tmm38/vEgjkbQUmU61DmkapT5y3TIa0uN
         3laA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=VB/tVzHx542NdE3ovrJj8GJ9yV2C5QxKRxxJJKr/wSE=;
        b=J6GuAsl75ABt2ERATFGLIF1CEIaaulLGIZV2LoXWyuBmgQ52B6KdK5xptZh44E2S0R
         YH03WukGJENH1Cj2xlq6Jx9NpI0m/p6lLz/gtT6rqn8wdpm02ILPc2ZRxCNRewgT6bga
         xrLRnUn3cQwGj96JLzQUiOga60lOS8WrMHCfk2PwSxwNWv2lIuUbONMfnDLnVqqsRuaJ
         xWXsWpm94mRiv9RvsgSnuoi5nsdv+JsSosk3nat9Kuhk/8F6yb6PuBbqgAcJg2V9L24+
         TDgU7UIcJxBR6T6AaVfxcSjQ8jK+urEUXv7LmH76j9N03/CjQRPI4kc87qa2dr2Eo4sK
         3zvQ==
X-Gm-Message-State: ACrzQf319tbMdBRTTi0q4KfwalepG2fkYKqEUkms2WMklDxg9qd7BLbG
	0BjcgD2PBqBnjO/YtdQmxopwIfbohkA=
X-Google-Smtp-Source: AMsMyM5wfRfBX8RJJJ4jc6VSq6B8O2bNXn+F/CoNUP75MHpKmg7g7AxB1hzpFAm5Y2hZjlXe5J6ujg==
X-Received: by 2002:a05:651c:1950:b0:26c:5110:6f6a with SMTP id bs16-20020a05651c195000b0026c51106f6amr1100090ljb.108.1663591531279;
        Mon, 19 Sep 2022 05:45:31 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bi39-20020a05651c232700b0026c02fde0b7sm4433366ljb.81.2022.09.19.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 05:45:29 -0700 (PDT)
Date: Mon, 19 Sep 2022 14:45:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/6] soc/tegra: Changes for v6.1-rc1
Message-ID: <YyhkZ39WytIrb9xV@orome>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WXth3SsAYqAP0GMR"
Content-Disposition: inline
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.7 (2022-08-07)


--WXth3SsAYqAP0GMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2022 at 12:19:52PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b8=
68:
>=20
>   Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.1-soc
>=20
> for you to fetch changes up to 74f7f183d81c26a53c2b1708364069d391b1b4d6:
>=20
>   soc/tegra: pmc: Check device node status property (2022-09-15 14:10:49 =
+0200)
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------
> soc/tegra: Changes for v6.1-rc1
>=20
> This contains an assortment of small fixes and cleanups. One new feature
> is introduced in the form of simple wake events which are needed to wake
> the system from sleep on USB port events.
>=20
> ----------------------------------------------------------------
> Christophe JAILLET (1):
>       soc/tegra: pmc: Use devm_clk_get_optional()
>=20
> Dmitry Osipenko (1):
>       soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA

Hi Arnd, Olof,

you may want to hold off on applying this one for now. Stephen noticed a
missing Signed-off-by in the above patch. I've fixed that up and will
send an updated PR shortly.

Thierry

--WXth3SsAYqAP0GMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMoZGUACgkQ3SOs138+
s6HQzRAAk9ZNzBTUnytI7VE4yoheMriXpv6/0DTrBCtodUhOakkrBH1+/P756FPZ
2TpMt0htESSmzh9Ni0vkfMRUc0qnEUpJaTdSAY95hon/9+iBpV+xAvMASIuYgPkE
l9NGoL5JcL2Xe0aF1wI62vm5iWa+f8D5HKUU+qjOFJXOIiaYMM/fNZBCdIFpYc15
8+7DcXSJ43ubtms+Cni98X9zdNUgcdgNHcpMR4K5B9BE9kksjNqBpzsnYmddEOcw
4JJOdyV/BijCNpqgcH+1zFR2ibRU/INFWBKOwVRWXTX+3+5I/K1Pes25WhNBgAWB
412T4XS2yRdiUSR+o4hWbzY7JBy1Ce1nhYrt89HYSlqIn35QX4MrDHVsenNso6Fu
wHfeBgfgXCnFgxPFBqjKicyRAxQWMwqYOZPuiIwCsBzz5egFPdnm6af4rdS2bz8Q
2o3SsULL4TUHOZnD0L69jiU+zFBLgVxDpfomkDxp06mQdWTYedXjZO54Llxj2k32
NfK4rYvICWGO9tLtgsUbXwWVBO3RYHHs0VuDF8BLE35kAeFrD9njsUbtoI9JMN6l
LHyB1oT4y+jHC2BQiRqBysP8m5EyT7N+dEFh3KeJMnRWnwZA+m9zFZBQ4xDaETtX
h7IozxqvKtqONkjyyjT90oMs+WXcd7IT5EiCADbCcoVT4Itpl7s=
=oA05
-----END PGP SIGNATURE-----

--WXth3SsAYqAP0GMR--
