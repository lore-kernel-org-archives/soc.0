Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D703AB476
	for <soc@lists.linux.dev>; Sun,  4 Oct 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791145427; cv=pass; b=DV12VTrQREA5cfs4bp4maHQ/uQcNsx4an1UpnLGgpAtLTA4fd27TDiXwCHcTsKMGXBN/Xs/suEuknr82m9JsB2gShIarYlqNgtFVQzLkuouKSp9dCU2v+SCTN1iLb2RvVB0Z77Hn+YmhTmuqfPkvLAM9bJSpguMXRLNYLRadjqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791145427; c=relaxed/simple;
	bh=5infhzKJ3Qrv0cK61V/crQA9kSHDOe2GMzvVQuFrEH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L7NaAurNGiir1MuR4ERx5+s1Z9gqopWKsMk8IkBEo4C7Ht8yAl7mMzRcTWlnPmXa6Gz7dPyCZXn0vHfDa/705jwIE+7KOj+dH8Ucm+gnKOhEHU5qPSR8UbVjViPr8/MvCAIrT7LqAsSIBQkkf6S1WCoKXaWNbY9lHnUemf9MhFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=c16y1G7V; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="c16y1G7V"
Received: by smtp.kernel.org (Postfix)
	id A274B1F00898; Sun,  4 Oct 2026 20:23:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791145424;
	b=mAJHgMORYji9KjaCK7VetQFRn5RTyio4QLoR1fNg+H9RyBICjojIXFHDZIFZKX16G/hR
	 9E7VZ3GLZ+RudQwu63KvkKtkVRy9/+0kxVDd5zT6v7NXUSJPkWn8gKddx75bTR6K5bLc2
	 Dl/G1w8x7TMB51c0B/RhnxghZ7OzN9ghd58qwtXBdhKWCVi4/3TbD7+Puf8Ijp4mu+vld
	 ZYUBfMzLqt98461cXZ9+Pi15i1iPdgjZnXYEksgZQPZZ28djTv4Nz4WcM2kx6ZKhYx9jh
	 QNRxKjVEUh8EI8pwQUcu8Odpw1dz3zl/I3SmLenuFcOOo7PqYXkAsQlxn0l1hrZbM9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791145424;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Iu6lAlqaodgXtL2mhM3pv2AXvPYLj6PPOmWMM+ICyy0=;
	b=FstO/+9gLlB8ofVXDQYSQSF0y8SrV+FtjH6pLF7fsyY/NlQ2z7x+0xPK+B2nZuann8pQ
	 OZZSCRgakIwvnGoGefQu/xsKibHUDhZeeBNKmkfTEJ0L19WCBURhENLfT1EDuAZiVtIr4
	 3gJNCSxLFdlEw6S5iccQ7Z8F2gVZAfZeIq3yxjuE/ynkNaV64+a9RxPwbfSyTpPMvmk9p
	 qJr5p340KY1sM3wIKqLYbyxfTdzXXCZqIJ/ptsOPLn/qfgrCgrjJA5r2N3d5LBHPi91Rr
	 fKOvSHnPp0jO6cUD+nJz1UCuknNzOzbnCdDvX6mKNLKcEx17mKH7tXRFbk8NmKpGtkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c16y1G7V;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6B77B1F000FF;
	Sun,  4 Oct 2026 20:23:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=c16y1G7V
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 6B77B1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AF8984E41156;
	Sun,  4 Oct 2026 20:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 67A6E604FE;
	Sun,  4 Oct 2026 20:23:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D19451032820F;
	Sun,  4 Oct 2026 22:23:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791145419; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=Iu6lAlqaodgXtL2mhM3pv2AXvPYLj6PPOmWMM+ICyy0=;
	b=c16y1G7V3Ioe0+oCDYPDM2I9U+JWsVdQOiYqIA6G3gwfYoi5JqOLoQ8cuay0ksnsQdY2E9
	lK4VouDxVYAmicjPaIh60iWmhCFSp/p51SU/aJKSr8LAZVAfFbs1qOiRmbRABkyUo2wLeK
	hicmd84K0O5vBg3CCSw5rI/nWAsyQZCm0OQ2W3uMCUNHz2D0CXC8pIX+sT3OWh/rOZF7vE
	7yUzKWxjGiioNjOKptUxnbnvuj6gtON1j5guLJ/PNl7bpYsj9xEQXKAAPCUFvcEm6l/+fL
	cbdu0EkIVIknxqNygzphYns/+e13raCUNGNROrT/QWBrtdsR3GjvCWB2uXMIsw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: arm for v7.4 (#1)
Date: Sun, 04 Oct 2026 22:23:36 +0200
Message-ID: <87tsn16wqf.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for arm for mvebu for v7.4.

Gregory

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mve=
bu-arm-7.4-1

for you to fetch changes up to 76e67df8bc1cb72157368c3669119e64cdb0a6a6:

  ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x (2026-09-30 22:=
27:22 +0200)

----------------------------------------------------------------
mvebu arm for 7.4 (part 1)

Fix Cortex-A9 errata selection for Armada 38x that are r4p1 and not r2p0.

----------------------------------------------------------------
Qingfang Deng (1):
      ARM: mvebu: fix Cortex-A9 errata selection for Armada 38x

 arch/arm/mach-mvebu/Kconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
