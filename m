Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E0E3DD87A
	for <soc@lists.linux.dev>; Mon, 27 Jul 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143387; cv=pass; b=A+Bb60XuEoiHsAlDNKDDVcZV0NGbLiq5Tcvv/c9PK6sBKEkmPF2jN1tm7l1QV0eZTNYW/D5CMyeIr6H6M/ISfw+6/S0U94PXf58wjvobOfZ6F5C9iK6aiUAtSw2HJPj2XnsWCzIExPrRiXCf2cKEfj0YveL7/qFUakjYmU1xkgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143387; c=relaxed/simple;
	bh=Qfk+hH5je+fXyj+RkFVLzD58aCdF5jM3jz7UH6gHB7c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BmjKF8RJodZA4yo9pUwC4TrAbHxUvNHxWN0jmGDkg0hilcMfyeV42wJH10gqx68C5XBlsLfNO/qocOaz+1D0c7ECT4j97M9tmpgAcIK9VzlwglV7JwzuXcN/9WRAuzyKOPnHxrPr3O4vOFrYro+UZf2PMK7IlNHpw2TaxrLQmxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=YbZtaMzs; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="YbZtaMzs"
Received: by smtp.kernel.org (Postfix)
	id 446571F00A3D; Mon, 27 Jul 2026 09:09:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=211.75.126.72
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1785143386;
	b=qz25B0aXotQ6sffzTC19508/pDXQZcZmJsAkJFOiN05YLoOqRgshHzKGkTIai4t4FwlG
	 xan2SPVirUYhOrbyQ+tt9jiHNMsP2KZTHPkufCQoCaHm+yP+yRTvJJ/JmkGlhzMHZeIop
	 H8Zanx1by9dXATx4vBV/E92tBbkHJjcueDoi07qZU9gTTOCEiE6l2mDPWvJoSneD3wqTR
	 3fwTZUXRuMfl+Yky7noYKr5sSCAfcVnbY1Wx68o6QLNO6HUW6srX2khO/T3NTNrQ/68XB
	 0F5Jqm+YU2Y4P4BXeeaFL5k+M+P+PdHfrSi9j1w7HGTdV+j4bubj4r8JGZw+KGh487A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785143386;
	h=DMARC-Filter:X-SpamFilter-By:DKIM-Signature:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=jQVuTn532BqjpTrDnFAQRKU9WCgFqRlZl4YckJ5oZK8=;
	b=YfLqiuHnHJxP9NW/fMoGEV3hWuoqHW6Nuz54tzYFbZPwop8aAGLJeEhK2niC2XxBnf90
	 FwOJ4IFv6dCJlaZ2hO9m1YpbcR2nOHBw2hi1vNu9XK1XB65UkPa9QN0AGkcNLmWcNkQcm
	 CioxMr6OR9yLbd8IVf37Iikvfvpf6UMnUCmCZ38GqpuQIYY2S1Lzvg75Om04nagNvMeVY
	 whNStabSUN9MpckkMEWPraZV4lwWr2fwz9+E3VJpg/0LSfycYoz9VJefyAfX4VHp8VSpg
	 HLxh7ib/YtR45lDy6x7RRZO8HKnPi7CV9nl4ZJJM18KVshL74jlAhWOXUl/AUoxq+oA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=YbZtaMzs;
	dmarc=pass header.from=realtek.com;
	spf=pass smtp.mailfrom=realtek.com;
	arc=none smtp.remote-ip=211.75.126.72
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52CB81F000E9
	for <soc@kernel.org>; Mon, 27 Jul 2026 09:09:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=realtek.com header.i=@realtek.com header.a=rsa-sha256 header.s=dkim header.b=YbZtaMzs
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 52CB81F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=realtek.com
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66R99XML02986159, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1785143373; bh=jQVuTn532BqjpTrDnFAQRKU9WCgFqRlZl4YckJ5oZK8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=YbZtaMzsnaOn9Pdzjxk305YQUGe1fDBlfnzviCILeO9i67V7dsoeyKwktqlqymYWv
	 p+NViYqhdmKkWVtUTvry46TTS15lQLS/1Y3rkjBA6fpRuy5KgBI0OCJZIfkySkFNq7
	 xTe+g2PpHiTU3Wa0FFmCnOGUSB0wKXkfpGV4Rw07m73L1R7Z/DeDokEvsRDo8HuZEP
	 uGcG0mGOq+myGymXS2JJO3qxg4QBq70j34FZXGELJOzKqy8W39N4S7B7q8RIembBh4
	 rfMJoQbSjRL20rg1Y8YSOSdwa9Ll7xHdni/BVTF8XtOzuQX9p3CTAldHDJ6CHBKneL
	 87PYHJesuC4Wg==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66R99XML02986159
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Jul 2026 17:09:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Jul 2026 17:09:33 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS06.realtek.com.tw (10.21.1.56) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 27 Jul 2026 17:09:33 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS06.realtek.com.tw
 (10.21.1.56) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 27 Jul 2026 17:09:33 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <soc@kernel.org>
CC: <james.tai@realtek.com>, <eleanor.lin@realtek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-realtek-soc@lists.infradead.org>
Subject: [GIT PULL 1/1] arm64: realtek: Device tree updates for v7.3
Date: Mon, 27 Jul 2026 17:09:33 +0800
Message-ID: <20260727090933.908156-1-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/yu_chun/linux.git/ tags/realtek-dt-v7.3

for you to fetch changes up to 3c778f0c9fa36b6b9a26bd2146df24ed4e830ba4:

  arm64: dts: realtek: Add GPIO support for RTD1625 (2026-07-16 10:34:53 +0800)

----------------------------------------------------------------
arm64: realtek: Device tree updates for v7.3

This pull request includes the following Realtek DT updates for
v7.3, please pull the following:

- Add GPIO node support for the RTD1625 SoC.
- Marc adds the missing the EL2 virtual timer interrupt.

----------------------------------------------------------------
Marc Zyngier (1):
      arm64: dts: realtek: Add EL2 virtual timer interrupt

Yu-Chun Lin (1):
      arm64: dts: realtek: Add GPIO support for RTD1625

 arch/arm64/boot/dts/realtek/kent.dtsi    | 41 +++++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi |  3 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
