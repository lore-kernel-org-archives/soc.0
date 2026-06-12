Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17533DE43A
	for <soc@lists.linux.dev>; Fri, 12 Jun 2026 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249037; cv=none; b=OoOqMvOFZ5AT6Sm5DsNBQ799V21cV2y8x+LjdK71xzS3gUlZ2vJYVYj4oPypxbaSqseZKfReHKJe12P4gqaGMpW5r0O6lB3N9RGZnjEUxYoi6yahuYmhGqn9+eRQFXWH+Rpruf9OW6wCslE5QhBBh6IbO/cva7proL/elYUSvI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249037; c=relaxed/simple;
	bh=vMVPc8MlD4phQOM2dwYIAk0P341SgHo9D3n4pgEUOX0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=hnQcTcWQ3h7B7OEZ3H3bagG7JwrijIiqUGhFH+FJKihNxewoHjHXrKEiSVppRoSBm26tw0YiEe1Adtwsf2vjs3y//81BrAxsDsKvHH8aviyikOpbz2rtHu3Tcj8p29LQviBlzLEON7gGpqDHl17moo5SjsPM/tlQPUa7HwaTbc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=hsblgYSd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eKcMAIyR; arc=none smtp.client-ip=103.168.172.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="hsblgYSd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eKcMAIyR"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id F0C6EEC00CA;
	Fri, 12 Jun 2026 03:23:53 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 12 Jun 2026 03:23:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1781249033; x=1781335433; bh=VJ
	WqjLWdqxiOOONLY1vYfV81aAYcYQpnBLK55L9RBKk=; b=hsblgYSdEsC5CntnS/
	NXEZLp3a1V1vJhlbeAeWy4bdJ48VJw5GV5Kp0pUsMw4tG+8FGrpADx6AWwVCzQs4
	PKR0UEf5w/DwHZkRBDcMORbMt/7BjL8TL77cQZjgEi7RXXjmx9COfPB2oNQtkrj0
	g7SZKwq2tpzADtAbdS2abBjJb1jZQxfftC2UF7E4XDmLI2e/bcZf5zcRteVt+O8S
	1VDX7A7In2rX8KtsAdPadI7Hpu1KHoSktvIQ/hJwZvwqM/Zf2sFVf4kvVtEuSzJc
	cs/YZjGCv9MdAM7B1nD9NBntJRXj2xGocGCn5DGTAOKLdHCTItjk6q9e7RlkeyaH
	NXgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1781249033; x=1781335433; bh=VJWqjLWdqxiOOONLY1vYfV81aAYc
	YQpnBLK55L9RBKk=; b=eKcMAIyROJVuCJ6p0h2qDEuvcUWTOmZeUPXsaMgEhGnF
	BVAs2HyQ9LcfMiCZSJ/8aCvMTJJDLDYATDfYRRu0x9I/GHi8WZk53YhRcHYb96Cr
	7bg0IbAKxNq1lCmiq6+/EgjjJiln5X5gYZnMH/r21vTg2YNm5Bl2czQbT2Uup5MY
	xrd35O7ZL/c8G87p17JjmKpiH3pZlLmNUZ4GiEio2jYdhwKc28LdgAJtyA6yPMGQ
	chfx3KY1FK24PK7cAd+uWjMdpPWQyxWEtNB7ppqGC/34e4hJ6JyHfjkxLmZKksFk
	U+9BzlCw4VRzS46QC/DrlzcOfGBDKbL5guPObic3hQ==
X-ME-Sender: <xms:CbQrahckZ0DXUECCFwJxqlFLXjjPgZGVfc2KoxxJTK_QPL3-7OpLPg>
    <xme:CbQraqDbGSlKpWC1lbW7Y-niPkvpZ9TqyxoeO61sG-9twS1zZEoa10L0hIaw6q3AV
    kuhjDChPcXkdkfXOtMCOxIgpB_tNB6PBAXDwOZLZy_Uq1ecFAZuK4ib>
X-ME-Proxy-Cause: dmFkZTFCU8dyaOy0zPeQGTvbpEbEEj+fc1idaXb0IffyRnewPAWGTHIcvNY0sgnO47EBFn
    BrbzSozhTykbwTc/DamWcLo9lQsFdWgn1+2gv6iY6IHpDqOhNshVCTRyWhBuhX8Lmjkois
    BXSu+MRZIFvBr86oY6weB194BWISCtyyPWmGeXsFhzo1pr+x2Xu25sCh1YRMNl1r66pWy7
    sMAsiIO2OMgiAt4q+lZ0bGNdY/XaNSNqKGhmLdczDXzKQQw6zqtCrbBbg9vN/m2ICgGLlU
    fFu1oJbvEeUOArewe0xb17KqMyFCE0PaOyf4xOIwLmuwaHjAYa5c5ZjK6+sj2GF+ixJwn/
    qWRMwR9LC2+OSPHUzraVb4Jrnd7fsFpT+VMW2p+wSpWo8hufaXAVQypTmSCfpfmPgxi2xR
    03cQQP7uZLIYO0rY1HtWptEY95g0tupOLZxpqe2DUh5HrpH3G9w8RzXEEcLMY3XobiCqzS
    YZtkzlKse6CT4+gKPRfwoF1lchheORQI1XuV+ff2w0HQGgAj6huulXQyUDjwcyH1GqGBbu
    bacd3rg86ayP6krOjjkHfdDeZnGxIpf1eDvyvV+PHsBDvyKPLXdVcdFHSwnkHADyrEk2Cg
    rL7XVTpmvUbSugxmLXg7/doamAl+WzS1JJkYARrhmpK3Mf3iBOPdAgvmVCyw
X-ME-Proxy: <xmx:CbQrajIWXhGXE5BQmqGZEQ6Ysjo_OHi6Zw6JpbQJPFkRwLxsYLjZ8w>
    <xmx:CbQrauBFRdpmbESH-AZw6CPMubPTH2rmkYViZAGJNj6QJaSFvGOUdg>
    <xmx:CbQrakCT2Hl9_jZWXOEQ7d22kfq6PYeCznt1JX_cgxMUY-DSUk-ghw>
    <xmx:CbQraoBcIzry-YaCGuapBEMNiavonnhgTcTFtfDRsZMTPScUY4m09g>
    <xmx:CbQramTkhpTVUqWqPl6YCvwfnB6dpLVszg2xG1jh8tOiK7uZBAPLwzJm>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 44B22182007E; Fri, 12 Jun 2026 03:23:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A92O7juWEyRc
Date: Fri, 12 Jun 2026 09:23:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <f4034eb3-455b-4172-872a-5e94a53627b0@app.fastmail.com>
Subject: [GIT PULL] soc: fixes for 7.3, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit 7fd2df204f342fc17d1a0bfcd474b24232fb0f32:

  Linux 7.1-rc2 (2026-05-03 14:21:25 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-3

for you to fetch changes up to 9c648f3554920721d8878807cd794fe2d7f989e8:

  Merge tag 'v7.1-rockchip-arm32fixe' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes (2026-06-09 09:16:26 +0200)

----------------------------------------------------------------
soc: fixes for 7.3, part 3

Two more small fixes came in, both addressing corner cases in platform
specific code: the microchip mpfs system controller probe and the CPU
power management on 32-bit rockchips SoCs.

----------------------------------------------------------------
Arnd Bergmann (2):
      Merge tag 'riscv-soc-fixes-for-v7.1-rc7' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into arm/fixes
      Merge tag 'v7.1-rockchip-arm32fixe' of https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip into arm/fixes

Felix Gu (1):
      soc: microchip: mpfs-sys-controller: fix resource leak on probe error

Heiko Stuebner (1):
      ARM: rockchip: keep reset control around

 arch/arm/mach-rockchip/platsmp.c            | 16 ++++++++++------
 drivers/soc/microchip/mpfs-sys-controller.c |  6 ++++--
 2 files changed, 14 insertions(+), 8 deletions(-)
