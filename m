Return-Path: <SRS0=C7v2=OS=microchip.com=prvs=922ab42b8=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C23C3DA49
	for <soc@archiver.kernel.org>; Thu, 18 Jul 2024 07:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3CD96C4AF10; Thu, 18 Jul 2024 07:22:26 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4D8B0C4AF0B;
	Thu, 18 Jul 2024 07:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4D8B0C4AF0B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721287345; x=1752823345;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1lxmhtYpS/88pIYbRToQWF25tT8jA2XwSvzGR+ZqkO0=;
  b=NcBO4+fkDnwo1bnYwopqiBhUWMQHbuzP4AdCm0+sRMWtFM4A7hofrHO9
   p9e0kVmidI9XAECMfVuh6GkeAYbSWCxXkAbpntBm7Fq0jfWxlmB1jyDfJ
   WVOH7nHQNh7Sd7E6ysIi4mVfGIr622Xem77GJ8M/MfACXPia06bPMtLIt
   bPRYxiAEl7ZRB0jr+b+kwWfCsH+Pj1AnsFZeBKeXHzTVXtDH8/WSGQBEf
   ojY60PwWTz6CS7UsQxQMbTCd3hnBPFzGPppV6fgx+uSxar5EjtcnO3zpi
   mknnzIwIuxUorYvvIrj9Hf4RbHi5fgS2BTzcuNCRlln0727XlHJRXAad/
   Q==;
X-CSE-ConnectionGUID: oLjE02PpTBywYQTZMe8uCQ==
X-CSE-MsgGUID: CkM2LwxjS12RAdf3DGg8qg==
X-IronPort-AV: E=Sophos;i="6.09,217,1716274800"; 
   d="asc'?scan'208";a="260279899"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Jul 2024 00:22:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jul 2024 00:21:42 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 18 Jul 2024 00:21:41 -0700
Date: Thu, 18 Jul 2024 08:21:18 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Chen Wang <unicorn_wang@outlook.com>
List-Id: <soc.lore.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
	<soc@kernel.org>
Subject: Re: Fwd: [soc:sophgo/dt 1/1]
 arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
Message-ID: <20240718-unworn-showbiz-2fb68210b43a@wendy>
References: <20240717143016.GA94990@thelio-3990X>
 <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xbuLj/oQapO6I27o"
Content-Disposition: inline
In-Reply-To: <MA0P287MB2822CE874640F2525DF59712FEAC2@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>

--xbuLj/oQapO6I27o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 18, 2024 at 08:49:33AM +0800, Chen Wang wrote:
>=20
> EXTERNAL EMAIL: Do not click links or open attachments unless you know th=
e content is safe
>=20
> hi, Conor,
>=20
> Do you have any good suggestion on this?
>=20
> DTS changes are submitted through Arnd, clk driver changes are PRed
> through Stephen. DTS sometimes depends on driver/bindings, when this
> happend, how to avoid the syncronization issues when merging into upstrea=
m?
>=20
> Actually, I have seen a simiar issue on reset driver before, but this
> problem occurred again on clocks.

What I have done in this case is to apply the patches with the binding
headers on top of a -rc tag from Linus and use that as the base for
applying clock and dts changes. The jh7110 stuff is an example of this:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dri=
scv-jh7110_clk_reset
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dri=
scv-jh7110_initial_dts

Both of these branches share the exact same commits for the two
bindings. I have heard that previously that may not have been acceptable
to the soc maintainers, but so far Arnd has not complained to me about
it (although I have only do so sparingly).

There are some other approaches, that are mentioned in the soc subsystem
maintainer document:
https://docs.kernel.org/process/maintainer-soc.html#driver-branch-dependenc=
ies

I've added soc@kernel.org back to the CC list, so that Arnd can
comment if he wants to.

Cheers,
Conor.

> -------- Forwarded Message --------
> Subject:        Re: [soc:sophgo/dt 1/1]
> arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
> 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
> Date:   Wed, 17 Jul 2024 07:30:16 -0700
> From:   Nathan Chancellor <nathan@kernel.org>
> To:     Chen Wang <unicorn_wang@outlook.com>
> CC:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
> oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
> arm@kernel.org, Guo Ren <guoren@kernel.org>, arnd@arndb.de,
> conor@kernel.org
>=20
>=20
>=20
> On Thu, Jul 11, 2024 at 07:09:48AM +0800, Chen Wang wrote:
> > This build error is due to the changes about
> > "dt-bindings/clock/sophgo,sg2042-clkgen.h" are still on clk-next and ha=
ve
> > not been merge in the master.
>=20
> A tree needs to build by itself, so changes like this need to be made
> atomically. Mainline is now broken because this change went in before
> clk-next:
>=20
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9=
966522897
> https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/9=
966319154
>=20
> Please ensure this does not happen again, it is really disruptive for
> people who test the whole tree, especially during the merge window when
> we are trying to catch breakage that went in without being in -next.
>=20
> Cheers,
> Nathan
>=20
> > On 2024/7/10 18:56, kernel test robot wrote:
> > > tree: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> > sophgo/dt
> > > head: b1240a39511b9206293b82ac372c5114d6e15821
> > > commit: b1240a39511b9206293b82ac372c5114d6e15821 [1/1] riscv: dts:
> > add clock generator for Sophgo SG2042 SoC
> > > config: riscv-allmodconfig
> > (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV=
-lkp@intel.com/config)
> > > compiler: clang version 19.0.0git
> > (https://github.com/llvm/llvm-project
> > a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
> > > reproduce (this is a W=3D1 build):
> > (https://download.01.org/0day-ci/archive/20240710/202407101850.eIQyngoV=
-lkp@intel.com/reproduce)
> > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202407101850.eIQyngoV-lkp@intel.c=
om/
> > > > All errors (new ones prefixed by >>):
> > > > In file included from
> > arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts:6:
> > > > > arch/riscv/boot/dts/sophgo/sg2042.dtsi:7:10: fatal error:
> > 'dt-bindings/clock/sophgo,sg2042-clkgen.h' file not found
> > > 7 | #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
> > > | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > > 1 error generated.
> > > > > vim +7 arch/riscv/boot/dts/sophgo/sg2042.dtsi
> > > > > 7 #include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
> > > 8 #include <dt-bindings/clock/sophgo,sg2042-pll.h>
> > > 9 #include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
> > > 10 #include <dt-bindings/interrupt-controller/irq.h>
> > > 11 #include <dt-bindings/reset/sophgo,sg2042-reset.h>
> > > 12
> > >

--xbuLj/oQapO6I27o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpjCbgAKCRB4tDGHoIJi
0j0jAQD6AtuKSE8ljUvYhhKAg9JWzn4d/EF8q5VWTGKDPKa4VgEAmyXOT8/BmiK/
DWRfxrDHm3Pil6Ln1HuT4ZvV9mssQgU=
=yk6+
-----END PGP SIGNATURE-----

--xbuLj/oQapO6I27o--
