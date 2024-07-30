Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 761FAC3DA49
	for <soc@archiver.kernel.org>; Tue, 30 Jul 2024 14:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3F2D3C4AF11; Tue, 30 Jul 2024 14:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E7C32782;
	Tue, 30 Jul 2024 14:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722350969;
	bh=XZ2cFrPvnycLFexTeVA9GX2IueNcYDKJQvFOs01gkxE=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=mIutKeavKkh9vOHXgtOrZb/HShezUUeY+yg3vthlfDIts1sf2Oxx3KgYTIirAq3fG
	 aSTFChOFiEFU59Iv/o0mJNH352IY63vCaHusWif0L7b7Z+aaxi4BjkJQFfrRomZv+h
	 Q0aGW5s4g04VCwKaxmnFJzGBIl+R+h6iBXM1jsPGyupF9tF5ICuu9K8TxIvz2uyeoT
	 IYD9dWom9jlIABY5ZkIQGjjvSnSoUhXo+6M3s6wj0jQHG8bnXoYeFvJ5sPQ/sdGVEd
	 K7N/EbtUhO/uVbHfIU0/5exckjnDQWK9C/dQbCvGEEnSt7E+a3aJRFl0iLMuaym8HD
	 yjexFwWuAyV5g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org
Cc: arm@kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH 0/2] turris-omnia-mcu doc fixes
Date: Tue, 30 Jul 2024 16:49:22 +0200
Message-ID: <20240730144924.25552-1-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Arnd,

here come two fixes for turris-omnia-mcu driver documentation.

Marek

Marek Behún (2):
  doc: platform: cznic: turris-omnia-mcu: Fix sphinx-build warning
  doc: platform: cznic: turris-omnia-mcu: Use double backticks for
    attribute value

 .../ABI/testing/sysfs-bus-i2c-devices-turris-omnia-mcu      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.44.2

