Return-Path: <SRS0=UfjI=JU=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C8A9C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 12:57:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA0836145A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Apr 2021 12:57:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA0836145A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hkKI5mrgjzXFPWQv6UE0qqECU20xrIyB3di5sFrXUXM=; b=ct8vlmSKbccsCVzJ4ROJcpkwV
	uZKp9z0HVw9GqSSqY+rEGVIqMWJRlxSXUpLLXSgDMbF1ZEbveZD7JOTWIa4z7gOIawRdzeJgGVNTt
	E9HOSSTl9GL/hUDmM8y8uiinOPXFDGChfwlhQXsB1tF45gRNbbIQLLuMOi+6gwE5BQpzBuSe98mP6
	HNP7BfZC0S5DlXmP8Vw6OtAKmStRwV+wyLScOTQMQTY1gAWUXruQ0jZPn15JA2Xw0CJGXBmYY19Ut
	szxqxBl7PfqG5c5P6xI4XkCLE7/cz9lgu9soZtNKSbXimYySi7UMfWGBOX9YyZum99Qjt38XjlcIO
	72g7tdXgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZvLC-001VJ8-Mr; Fri, 23 Apr 2021 12:55:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZvL7-001VIx-5o
 for linux-arm-kernel@desiato.infradead.org; Fri, 23 Apr 2021 12:55:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=vrSCOv0VrXCxUxxR4cIzAHuXg+FaGnuPTqrTgUKwoDo=; b=KTuTZ5EXP/v4ruPP9Te446C2/A
 2X4n3gXE/kMm4PMr4SL6yn2EL0PEMQ7Br7w0YDPEWlrVQHMAx3Rof0+bErvh+skXzpxNUz8ffeGZm
 X1hbYjTWlqcA8J3+Cz5T6B48uBZnk2kazXI1zl5ssUUOTziTYG4t9ZP/6s6sSAoxvgkTtM+edWgSr
 rpKrmQpf7BS/tNwIiF08i+w2DnFzz5LtT7h1Eut1Rhs1j2JLvVjkTLzbfyn6apyr0fRLUHDe1Baoc
 JphY04goI7EYBt48l1CtmilK9ryncIcTqtx3inTEMQ+vXsejJUJpnXP0++nylTA9bxof3eZ4Qsl/x
 iqIDtayA==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZvL4-00EPK0-GB
 for linux-arm-kernel@lists.infradead.org; Fri, 23 Apr 2021 12:55:19 +0000
Received: by mail-ed1-x530.google.com with SMTP id i3so31668229edt.1
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 23 Apr 2021 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vrSCOv0VrXCxUxxR4cIzAHuXg+FaGnuPTqrTgUKwoDo=;
 b=vI32s9qwDMCK2NLicnXa4U1S5MTepJieLW+ANoBdfKh+msuAULtlF+SgliTn7/5dCH
 OI84mqpBiucXeJ2HmpmYk0s2GAQiFXLv37YpRDgwcKXu8hXTWkqpBRLA1H9Lj3zr+9hK
 YZ1NZ38Gu5Hf2fYuyWDWDod3l24AUn1kQDKz6tOjSLvuP2Z0M7CvgTblq6AyxSg7vYBJ
 4CBjEikDJwfOAoa2jz/M+IrLYwqGywHCqGs0qqaQhlKlsCIJ8tsR0TGgJvSgZlT+Xw9I
 teQBsKwg+sGqOLwh5y18I+g6HbYf6YbluPJIdAfj0zTFzqlwieSBiWQQNYMLD5lvA5tm
 onpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vrSCOv0VrXCxUxxR4cIzAHuXg+FaGnuPTqrTgUKwoDo=;
 b=sStx8hyc7g/2wI5TgTl/H4b8dMPRfiQ445o2UutMesu1PGXMIY6l2ROSLmG6vVG+TY
 Aiwxs6mvzOseGhF7zaO1rzZyUJB/4QnQx88rKcoftb7V5nJdRGXBxd/bNsEyimzawR7P
 ty4TQ5vLzXrTLw7PdMaxC64zEhVs2YLvRVHDBuH+F5ZLx+TAZ47CzkenqpDtZUJXz/32
 A45pi0jo8EIUN0kuVq8kMDz5OP5AtcBohST+x7Kqlwr0r9ES+ml3nuot7uDyqWed13vv
 KUI+d6GNNpCRiR5WZqZbEWisc08FkBQ3TmkZzRXEKlpZkNvKBufyHnRLRvsuGB7i4QT2
 9L1Q==
X-Gm-Message-State: AOAM533iX9mhu2QJxcILRGibWAO7HOUBLOYUK/NCkgtbIWHaoxD52tM2
 3Vi0ByyA+o4mzeziEIZrGkA=
X-Google-Smtp-Source: ABdhPJz5BEEFOUq5CpBS8XyPBWYY9NVLe29Da3ThTI+NsPdsuAUbCIDGj4AMUIfOtg6qarhv1pLFAw==
X-Received: by 2002:a05:6402:4386:: with SMTP id
 o6mr4327860edc.33.1619182516158; 
 Fri, 23 Apr 2021 05:55:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id t1sm3915307eju.88.2021.04.23.05.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 05:55:14 -0700 (PDT)
Date: Fri, 23 Apr 2021 14:56:03 +0200
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree fixes for v5.12-rc6
Message-ID: <YILD4yyPXuiYbHW1@orome.fritz.box>
References: <20210401172622.3352990-1-thierry.reding@gmail.com>
 <20210401172622.3352990-5-thierry.reding@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210401172622.3352990-5-thierry.reding@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_055518_564188_C8AD8386 
X-CRM114-Status: GOOD (  20.29  )
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
Content-Type: multipart/mixed; boundary="===============7373397127697872932=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210423125603.ZrEKlg9XbmDT5xj2OTNmRNY1oA8SdbCOFipfFpkeWSc@z>


--===============7373397127697872932==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0+uDXqlHZoQ8VZ/1"
Content-Disposition: inline


--0+uDXqlHZoQ8VZ/1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 01, 2021 at 07:26:22PM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab=
15:
>=20
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-5.13-arm64-dt
>=20
> for you to fetch changes up to 405fa9e9d8664e830982c5fbcb70f9ba8656bafc:
>=20
>   arm64: tegra: Move clocks from RT5658 endpoint to device node (2021-03-=
25 14:04:49 +0100)
>=20
> Thanks,
> Thierry

Hi Arnd,

I noticed that v5.12-rc8 is still broken because of the missing
fw_devlink=3Don patch from this PR. This PR was meant to go into v5.12,
but it looks like you pulled it for the next release.

In retrospect I realize that the way I sent this out was rather
confusing. Any chance you can still pull these into v5.12 to unbreak
the final release?

Thanks,
Thierry

> ----------------------------------------------------------------
> arm64: tegra: Device tree fixes for v5.12-rc6
>=20
> This contains a couple of device tree fixes for the v5.12 release cycle.
> These are needed for proper audio support on Jetson AGX Xavier, to boot
> the Jetson Xavier NX from an SD card and to be able to suspend/resume
> the Jetson TX2.
>=20
> ----------------------------------------------------------------
> Jon Hunter (2):
>       arm64: tegra: Set fw_devlink=3Don for Jetson TX2
>       arm64: tegra: Fix mmc0 alias for Jetson Xavier NX
>=20
> Sameer Pujar (1):
>       arm64: tegra: Move clocks from RT5658 endpoint to device node
>=20
> Thierry Reding (1):
>       arm64: tegra: Add unit-address for ACONNECT on Tegra186
>=20
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts  | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi      | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi            | 2 +-
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts  | 3 ++-
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi | 4 ++++
>  arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi      | 1 -
>  7 files changed, 13 insertions(+), 5 deletions(-)

--0+uDXqlHZoQ8VZ/1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmCCw+EACgkQ3SOs138+
s6GOhw//bxyGQ3ijzatDn52shnkQStaMkg2Qx6YO8yxrFrsfJNHwIUCbjGM7Dkyg
paEzMs0vaJo67kAKR3tr+sOkyQN2IUvM4mpIm7eGJJJBTXY7H4HVc1GUi76YiH+L
X+e4QxUcJadW09q2b0UbjRyDD20rdKxQ3OtJ1iigoLnI8lLSRYFlTlI5FOZ65Tzy
SNAiWM93MF5yEfDKQSzDHEY2XKMpabyhFJizYA0KcMCAJ+NC8WrZxxzIYjWeVAY4
ezG0kdthaYZPDUoJ19GScp/oJsZ3ItrjiFpJL5ZPadH0s4nbCnUDUW/a0YV4SGQt
Okc4PXjiOCDl5maJJHSkemLWiwjA3fyaX+heJwfe1xfmMBlE+138J3XS5Uj4/QyW
LTdg+2sJ8uN3Qb9Yg3Ln8Dg5oHVLWY3OhaGJgu3TiW9NiWstN/YOFqMYWJxe5ZzO
90iEcAakpVlBkcbEVU0WlzXxbiWF7QHpGc8uaH4tkerNHdtlMggymLTiIa3sSiQa
c8D9MaMYbiyvXVlhp4oNzABijJYlWQr5cUHRrdHWv9D6MGFk1Ta5IGvTBSSxsT8B
POT3Zx7KSXI+k0cj6/O176OrOnRlaNLZRpy8StLfKNToP5Rv/bOrnj0MT3BjXKWA
1Kx8k7PBS0HHdl1ZxuhRXITUwoqsuEGAbRal4qVqcl23NZ7/I/Q=
=SDbQ
-----END PGP SIGNATURE-----

--0+uDXqlHZoQ8VZ/1--


--===============7373397127697872932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7373397127697872932==--

