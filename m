Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F151DE4EF;
	Fri, 29 May 2026 07:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780039195; cv=none; b=Bx8pKMBsiiZGxN3vUK63UDas8nMqL+yp9p1aAPtm8Xa/banwJAEFUlklunytgXz473EU7WKrWoP/p3Cfrj/70CrarPQxsIbNQdDUvVXqpOaLZRAH9/ul+Mx/jkalY5cAaSnaOviqJmhUX2eyoPkL8oqAdaL9ZUhAp5JsSTicDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780039195; c=relaxed/simple;
	bh=35o4l85+B+unvcsmeTbJxyD2LIp2J4TwtFtFkif1y8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/ToPGm7v0AHeNCdf+eV8uZuAl4EYyTYQhLCjAu5uhR+SyZCXiDbzPOmkoFv0A0UufB22WPAyGAQUq6r5pquGY4ErL0KE8I31cEQuYOP1y7O7ITYzlUMM8KvxDL48gksi349NwiBNZv1MJun+7z2o1INGtNB7NK7OSG3xzExOlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/cUBU6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/cUBU6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D0F1F00893;
	Fri, 29 May 2026 07:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780039194;
	bh=ZyFVhwuz3Wua2eFFn8Y0+S3i1yT26hvDXs5dal+bNx4=;
	h=From:To:Cc:Subject:Date;
	b=b/cUBU6jy9d7IT+Qj2rN38bl95ewLPhBzbFkucGhUEjDFO5QWJr2w7mt2W+YKlnAa
	 SSfuhBcpuILnLXgtBd5KJY8OthQMIOpxlI04qpDxRKtkIIUaSXgXwTA9+bqS7r+MYZ
	 L8h1y1ev0vi09G2wUOV81Kqgn9UMwvjHw+2u/00wHYp8uAcIDZaISE7LZHU8smW34e
	 q1hLGVFZhYHitkss4dZFRShPeNsvpkB89C3sh737d/SRvUgey3Do1bQZGfTSx7yVc3
	 lw73xeOYkDsPHrHdZ8U7Nwyn639zZtSDMQxRfD5sTXdIdhLb0m7PC7okqos6lSwx3/
	 wPeSOyoYl57YA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memory: fixes: driver fixes for v7.1
Date: Fri, 29 May 2026 09:19:48 +0200
Message-ID: <20260529071949.12520-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281; i=krzk@kernel.org; h=from:subject; bh=35o4l85+B+unvcsmeTbJxyD2LIp2J4TwtFtFkif1y8M=; b=kA0DAAoBwTdm5oaLg9cByyZiAGoZPhWgVmqzDCddo9n25ua8/ZyXagPi+aoSF23pbQe8OzIPw okCMwQAAQoAHRYhBN3SYig9ERsjO264qME3ZuaGi4PXBQJqGT4VAAoJEME3ZuaGi4PXDiMP/1nf IAyaETUiZrTu53v+PG9fnUvqiIDb8bfAj2Hv9zgj2bqFtLwsbE/SJCU8Puk2YSv1+YlnDePbLzu ZLE2+QuiQ6Xf5Lz6wpU6pngOtWqPgHQrR9yh0/RxBA8acNaFOv1zzPRG/YO9n5lHTabCg5FQFqx EXmmotMATdrCtZOPYb/gJuinzR2u4q6+jm5/0Gsjb8R3WFJZCf4IyoYYFN1xenIV5zjT1A6tVty ei1tml2n4XwnEnbm+tE2vdBLHm+b4nrW/1DYYwkDJrxKFggqidC1rsRf4sT3lnJjrP5bpzo6VqP OISi6L8ruHjBfbSnTweiu7Y9t6BH1E2hSu8ZLb6NP9RIBWyoc2+dNiEgxh6+CTsW0YXdutuIaqP 8gqXK0YFbo4Alrp/tfybmqdi93/8Olptqt+z4+wmSSSt/to1RW7gjFkRL3kb7UTPr0v5guZEjV2 IY7i9mLpXc/oSRaugqqytvaON4AnwSUPflRGXlGdLyQKYop5TeFvwilcSWqE/BF/r+mhJxO++P2 vf1I4KbKfGEqJHsdxC/alFG//SnuBFGc4EiUFYF/kQM/1V1yn08zxfZQCJxiyaUVJbUlSyaTMkB KNz0kSEIwm0J/dr6X7enzp/hXxjnelhEsj9Uw0v52PwyUtIzjHTRra0B4CNGg1XbvG3+9WPo9y7 GnpnF
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Hi Arnd and SoC folks,

I completely missed I have a critical fix for v7.1, apologies for sending so
late.  The actual issue was introduced in v7.0-rc1, but it causes the board to
fail to boot.

Best regards,
Krzysztof


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-fixes-7.1

for you to fetch changes up to 754d60ad1c91895be0bc7d771fbf9fb3c9448640:

  memory: atmel-ebi: Allow deferred probing (2026-05-04 19:15:59 +0200)

----------------------------------------------------------------
Memory controller drivers - fixes for v7.1

Fix probing of Atmel EBI memory controller driver e.g. on at91
sam9x60-curiosity board due to usage of platform_driver_probe() which is
not handling deferred probe.  Lack of EBI driver caused dependant NAND
controller to fail to probe, basically failing entire board boot.

----------------------------------------------------------------
Alexander Dahl (1):
      memory: atmel-ebi: Allow deferred probing

 drivers/memory/atmel-ebi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
