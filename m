Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B7375F65
	for <soc@lists.linux.dev>; Mon,  5 Oct 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791238979; cv=none; b=E5YC5X7wtNojRjwGKVjVswd7Bm9yus3BiTi8QsWNCpQ2w0CJVGUmecj8RVymsEGl79E1C6GjcMpFFx++EIZ4aG+/3MeZXYeOa7TaaObQjb6nli+RvNUF5hvkn3yXgnv0Qj1k1cca+qRafVlWprnQR73GojP031lRKWHe/SUCPM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791238979; c=relaxed/simple;
	bh=qMmzykFtscbGHC00R+l6X+INlaEJyBifIWTAPGZsEAY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Sg2DsjAKeRIEVj07fTr+sjHq5fFeO8JQQHurrpYd0j4TS7vjf3P0eMD9h6Q3vtZ+mugCqQQmouZ7vyfJb2OIQssA1jtTZAVx4jJiCudboNV5QbcLHD/ww9njJKJJ7Zz+o+Y2N0xNQWifGoP+XJ4pjjfx8QTB+ABtcYoEL5raePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGSy/atS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGSy/atS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5AC1F00893
	for <soc@lists.linux.dev>; Mon,  5 Oct 2026 22:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791238978;
	bh=meSfnHgTKRo60dTT4qxKQPctKIG2RRQoacJu7LFLAjE=;
	h=From:Date:Subject:To:Cc;
	b=nGSy/atSuEI/tZhIZVM+ijm4nEb08xjkiNgFVxK3vhiBgqfsOFT0NJiTcZYansihJ
	 43u+v51+ib+Ehbm98b1KWAOigk2kQC61n8Zv+dKmzjm/syBOlBjvwVHK/r5Ww+excV
	 9J1jNIfC++9QRkCBybHI+uGFH/i0zShFI2jrqmosLuPWLif/ihaOB1p0a7tC5RScAs
	 dVfGbr7RxNTMcxYNUlhVYZweqvsBsWLgFwSSvnLhB0G2CobGnILC2ruSD6i1+TzYiS
	 2f11d3jI5KeEEFCvHy/vAO6/x2c3vbqj9XEt7JxsvKbiRBqFv/aQtH/lybJPSd5kkm
	 YqOdb2NHxwoYg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcc9f6d33cso217615e87.2
        for <soc@lists.linux.dev>; Mon, 05 Oct 2026 15:22:58 -0700 (PDT)
X-Gm-Message-State: AFq9FYLEoOsjTbtr26fSjzs+b2ocC48oYUvroHEDgSBZlnjF0EZbJbKh
	pzSms8niq8lDLR3s7JxymJ734xx0GuAGHjABB84peR1SLkE9ZGMZxeiJssaUKoXGDDLZsA6vL+R
	UkAahetEK798rS9Az2jDNg0JZ27W/2v8=
X-Received: by 2002:a05:6512:260f:b0:5ba:36b8:ed16 with SMTP id
 2adb3069b0e04-5bcb5441a09mr2466647e87.11.1791238977050; Mon, 05 Oct 2026
 15:22:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 00:22:44 +0200
X-Gmail-Original-Message-ID: <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
X-Gm-Features: AclHuK9q-maIWLr3qj80d9l2Unjh_6rOYSIVSsiYteeGYqXFZeAW-QIeTbOYijQ
Message-ID: <CAD++jLmcwRM=WhFmQXuNMErLqG_3XRqE2J+izqQVHdANB=ogEA@mail.gmail.com>
Subject: [GIT PULL] late Ux500 DTS changes for v7.4
To: soc@lists.linux.dev
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi SoC maintainers,

The prerequisite DTS and driver changes were applied to
the power tree two days ago, and this goes along. I hope it's
not too late for v7.4.

Please pull it in!

Yours,
Linus Walleij

The following changes since commit 2eb92e6b94b612eccb53366f65018ae5e8d072d5:

  ARM: dts: ux500: Add Samsung phone audio graphs (2026-09-23 19:26:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ux500-dts-for-7.4-2

for you to fetch changes up to ff1501cbb825de117267124ecb8898112b4051c5:

  ARM: dts: ux500: Use AB8505 charger compatible (2026-10-04 22:23:59 +0200)

----------------------------------------------------------------
Ux500 second DTS update for v7.4:

- A AB8505 charger compatible and short interrupt list to go
  with changes merged into the power supply subsystem.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: dts: ux500: Use AB8505 charger compatible

 arch/arm/boot/dts/st/ste-ab8505.dtsi | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)
