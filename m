Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799782AE93
	for <soc@lists.linux.dev>; Mon,  4 Nov 2024 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730726814; cv=none; b=LvClXV7RvsCVDC8iarrn9ZmOMJD/8e8ZPe4HB+Sxd2WF5BR7PEt/KnxHmvuunO68jq9uNop7h/FukhaoDIma31rbSu+x8qrFRGOJLltNjgCSFxEIM3AkLS8Wnal/N/+WaNMIe2JVXIOx6sSbeYlchtMwI4B77iROUlKEWn7OClE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730726814; c=relaxed/simple;
	bh=WaZx01qD9NePzFDEReTPriogCvM/kSBfUzCS/dqVna0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e7pPkm48HixhWJcyF1lLPZM40lQ0QjnDuUI7a/aMy9uDaDoeWZep/V+dhBXOH7qEC01w4AV8oVfb57P0SFQcF/tw+ca8dd2liVeyBuBkPZOgXfM3wGa2+t5j48ZPwB+nLlmCswNs9Q9tSUINmbTfc+iJ9pgDQ4ALc2gXbzIineg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 1FF89C4CED1; Mon,  4 Nov 2024 13:26:54 +0000 (UTC)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 254BCC4CED2
	for <soc@kernel.org>; Mon,  4 Nov 2024 13:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 254BCC4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae0d:26ef:36dd:9be1])
	by xavier.telenet-ops.be with cmsmtp
	id YdSh2D00K31l0Qj01dShZH; Mon, 04 Nov 2024 14:26:43 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x65-006FvN-Ss;
	Mon, 04 Nov 2024 14:26:41 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t7x6P-000BJz-J1;
	Mon, 04 Nov 2024 14:26:41 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/2] Renesas ARM defconfig updates for v6.13
Date: Mon,  4 Nov 2024 14:26:39 +0100
Message-Id: <cover.1730726154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730726152.git.geert+renesas@glider.be>
References: <cover.1730726152.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.13-tag1

for you to fetch changes up to c520bbb523304ba98de9ffeeb0ef289921434125:

  arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3 (2024-11-03 12:33:11 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.13

  - Enable Battery Backup Function (VBATTB) and RTC support for the
    RZ/G3S SoC and the RZ/G3S SMARC SoM.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: defconfig: Enable VBATTB clock and Renesas RTCA-3

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
