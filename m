Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9BADC54E58
	for <soc@archiver.kernel.org>; Tue, 26 Mar 2024 09:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFC1CC43394; Tue, 26 Mar 2024 09:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D872BC433C7;
	Tue, 26 Mar 2024 09:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711443738;
	bh=WQ+cF+034E9q7/WZ9h3VF5pW/cDvMG0GTg4ysQG2vd8=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=Y+o7YGM1Bhh0+vBy3w6klRkT3AlLzLcjjlos/3EzTFNrI9tn7ch//IEBR84syjAh+
	 0h+svC/qIDCTdm2vfffxq1WGjVSJcnLmV3Tq7DuN5dX8LcxefHNaM0gI7bf+v1bguI
	 DszCqvLGB2elUO9i5cV/aVbMgZtJ6rAAapd3OHaJEAV8jJbJ70DjUqurbui/jeVf6e
	 anH1PUng5LE6sXUchcBQEof9cXxTIGnfG+bTmJiiq5OQrunk06DuZwZ/m/N82QMjFE
	 RT+6ZUcMwvyEFKnp10ROFPK4TOxZ8mCKPtFHfgCpjw0fGRvpwUgJY4lXw8jCUpXuJv
	 VYxNoHDRdbt/Q==
Date: Tue, 26 Mar 2024 10:02:13 +0100
From: Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 01/11] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Message-ID: <20240326100213.741e77ba@dellmb>
In-Reply-To: <dbadaff7-494e-4e10-a8d2-606f5a70e39d@kernel.org>
References: <20240323164359.21642-1-kabel@kernel.org>
	<20240323164359.21642-2-kabel@kernel.org>
	<dbadaff7-494e-4e10-a8d2-606f5a70e39d@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.39; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 Mar 2024 09:45:00 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 23/03/2024 17:43, Marek Beh=C3=BAn wrote:
> > Add binding for cznic,turris-omnia-mcu, the device-tree node
> > representing the system-controller features provided by the MCU on the
> > Turris Omnia router.
> >=20
> > Signed-off-by: Marek Beh=C3=BAn <kabel@kernel.org>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> > Changes from v4:
> > - #gpio-cells changed from 2 (pin number, flags) to 3 (bank, pin number,
> >   flags). This is because two years ago we added device-tree fixing code
> >   into U-Boot [1] which adds reset-gpios to PCIe controller nodes if
> >   these GPIOs are controllable via MCU, and the code adds the gpio
> >   specifiers to have 3 cells. Implementing this driver with twocell
> >   specifier breaks PCIe functionality for users which have upgraded U-B=
oot
> > - added documentation for #interrupt-cells and #gpio-cells
> >  =20
>=20
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
>=20
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>=20
> Please kindly resend and include all necessary To/Cc entries.
>=20
> Best regards,
> Krzysztof
>=20

Will do in v5.

Marek
