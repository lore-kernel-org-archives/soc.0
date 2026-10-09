Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAFD1ADFE4
	for <soc@lists.linux.dev>; Fri,  9 Oct 2026 00:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791505847; cv=none; b=JHeMehVCOhEc7egoEr9Pwbt/HWZOvhBhNTTsQSizLJK0cQAyYaT6W3aD51PVrtlx0KIOBesQ3YFUhB98rnUCJaAeue2jSMZgIs4rgP9u7IWDiAx48U+m/F8mTUsZf3ppHFrzU+6gYL+yRCzEBqKaK+El4Ou1RVNi7dvtGVa0f4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791505847; c=relaxed/simple;
	bh=5doB1BE1XPWENnR7lFHz2tgV1MGaGm+wbaE1Da8t4cI=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=hTk2FZ7T4miWtLraB24GmZpl3jSJXmt39yZZxOWFGAPXqXLYzoi/tX41Nv7iVQ/ysP6zgkhjZAIsxj93PyQMb9ZeIncYG69tMqocOsXy15iJ8Sy2r1R4U/8FXrmzVtR+Nwa02siEIpwXe2cJqvGTtiIUF8TcaJXHgE/93v7Giyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Q3YhmVQw; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Q3YhmVQw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1791505837;
	bh=waRfuVZmS/2NjhSFY0tBe8TyRqDp7UrLfXWJQxU09HU=;
	h=Subject:From:To:Cc:Date;
	b=Q3YhmVQwB9+RIreU54jWKPRuoPrE6/uvQFVIUI651pGL/jGOMTXh9GG3IErHcAyBH
	 7Y9/RhA49V7KdzAVyk6rotpaLUqyUeZdGZCQkzg8pnz5wkJSnVOHY/sy5nabTCX63r
	 A+/4bOC9Pn+WaqW/f77hOCnbT4H15d7WvwuPTa4x5oBCHzHifMZoDr4H+Gk+fgfqF1
	 6LVHodLQGEbw3EPxT7oydKAq66+LwK5C2KxtEV5ltFnw7RAPY0mvbWuosvIoojvF6M
	 wtfZejvKe8e4qjIxB+mdp22nNpclx/tuaNAfwx4r6OvvSg5rLL8MxrBmEOfleGY6zk
	 baaDhldkLzkVw==
Received: from [192.168.68.117] (unknown [180.150.113.112])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7CA046F499;
	Fri,  9 Oct 2026 08:30:36 +0800 (AWST)
Message-ID: <1a070f5c87b1e4e765a7e481b53f66242a9753ec.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for v7.4
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Tomer Maimon
	 <tmaimon77@gmail.com>
Date: Fri, 09 Oct 2026 11:00:35 +1030
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

I've been absorbed with efforts outside of the kernel recently so
there's not much activity in the BMC tree this time around. This is the
only PR I plan to send for v7.4. That said, there are are many patches
on the list that need attention. I will get to them.

Various revisions of series I've applied from Tomer have been on the
lists for a while. I've worked through some tidying with him in recent
days so we can get them applied. There are still some process
improvements necessary on his part with regard to sending patches for
the BMC tree, which I've discussed with him. I've had to lightly rework
v10 of his series in order to get it applied as noted in the relevant
commit messages.

The work in the tag is currently in linux-next and I am yet to receive
any negative automated feedback on it.

I'll be travelling for the next week for the OCP Global conference but
will keep watch for any concerns that arise.

Please merge.

Thanks,

Andrew

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-7.4-devicetree-0

for you to fetch changes up to c895734d0ec6c3e94f1fb3a0575b9a7076201d9e:

  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes (2026-10-08 10:23:=
24 +1030)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for v7.4

A short series of enhancements for the NPCM845 SoC and its evaluation board=
.

----------------------------------------------------------------
Tomer Maimon (4):
      arm64: dts: nuvoton: npcm845: Split APB address ranges
      arm64: dts: nuvoton: npcm845: Add peripheral nodes
      arm64: dts: nuvoton: npcm845-evb: Fix DTS coding style
      arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 700 +++++++++++++++++=
+++-
 .../arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dts | 439 ++++++++++++-
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845.dtsi   |   7 +
 3 files changed, 1141 insertions(+), 5 deletions(-)
