Return-Path: <SRS0=Hao/=OF=microchip.com=prvs=90971d8e0=Conor.Dooley@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B95CC3271F
	for <soc@archiver.kernel.org>; Fri,  5 Jul 2024 06:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E13B4C32786; Fri,  5 Jul 2024 06:49:45 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0078C4AF07
	for <soc@kernel.org>; Fri,  5 Jul 2024 06:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0078C4AF07
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720162184; x=1751698184;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5PyhqhLLX0wY9s7qI2dwXKTDneBYJuRYip+3dnCjjqA=;
  b=FxrEPF+0UYMTxD+c2IQQHMso+PcMS6515AyFL2G5IkUhBy7aG/VJfO88
   zs/c44u5sv2leOpAw4Dk4UJJjyTiwbMh4THYbgLTaVrlZb9KM4s35TqCn
   380+1pVNOzDeC8dRqeO/KIALYZccDrR0lchShqZHTupE3w9olZzvOSgrp
   J2jE/1VperFuLQWGaJFyTd6A+u8Z6C74cnf3mU/ftCJaYHR8NfEvIYaAs
   CUc+tnkafPRUjLsXwRuiEXJqBW8I3ssxqtuU9cQrHf/gvx40rvMPtenMv
   fyo9I/bN7ZEaTWQSJCj/RTa+SxQFnK+9/IqnnB3NK9LvaZOuLd8419DTj
   Q==;
X-CSE-ConnectionGUID: geSbLjp2RTeT/aBbLF2vsw==
X-CSE-MsgGUID: ZSqQLlDlROqmZcfdj7LjFQ==
X-IronPort-AV: E=Sophos;i="6.09,184,1716274800"; 
   d="asc'?scan'208";a="28846050"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Jul 2024 23:49:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 4 Jul 2024 23:49:29 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Thu, 4 Jul 2024 23:49:29 -0700
Date: Fri, 5 Jul 2024 07:49:08 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Drew Fustini <drew@pdp7.com>
List-Id: <soc.lore.kernel.org>
CC: <soc@kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2] MAINTAINERS: thead: add git tree
Message-ID: <20240705-hemlock-bonding-7f02a02f380b@wendy>
References: <20240704180913.2516959-1-drew@pdp7.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4yo7tzps98V/bKxn"
Content-Disposition: inline
In-Reply-To: <20240704180913.2516959-1-drew@pdp7.com>

--4yo7tzps98V/bKxn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Arnd,

On Thu, Jul 04, 2024 at 11:09:17AM -0700, Drew Fustini wrote:
> Add git tree for T-Head device tree files and, in the future, drivers for
> the T-Head TH1520 SoC.
>=20
> Signed-off-by: Drew Fustini <drew@pdp7.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Could you pull this directly into the soc tree, I have no "fixes" in my
queue and this is based on the PR I sent you the other week.

Thanks,
Conor.


--4yo7tzps98V/bKxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoeXZAAKCRB4tDGHoIJi
0lOVAQDwsOAuPQYZg3E9go7gmLT88tBInToF6zXJWQPOoGJ/fwEA1ivkPGP1Yhmx
FcujkoGDw+Uqb3ll2DmKTWPS+7u/Ygk=
=l4cb
-----END PGP SIGNATURE-----

--4yo7tzps98V/bKxn--
