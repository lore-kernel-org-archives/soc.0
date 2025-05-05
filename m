Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9432CA8
	for <soc@lists.linux.dev>; Mon,  5 May 2025 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746464298; cv=none; b=Uj5TU/ANr6Cpo+eHeNrhRNIGskkcAx8LvlkLM+AFr2evuSCjvQB8MbCACQn2XeUvKgS+ajUlMUHiPFyEYL/ucUXax7nepjvqPGAjAcBrjOrpOuT3gq51Nar+jOUJOc92dmFJgSpZRD1lJOjCg50POg9CbZJlvLMETwl3UYbX17o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746464298; c=relaxed/simple;
	bh=r8I8dxX64lKddPXDq8tyZRhDh3NOo88oDYad4mGy5sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+BPcLUm8lz8/CiDAw2MGzjLRFDZYTFZkn6HUfLbmbzzAbsDueYNzPOCtRDKIP0wNn2zYEtNH+m0fCqW4y0TiYNPQsL5tmEmBm7YYZw5oJj1tWLWGLifluvEtn2CmcA0W2Ug5xQoxT5P+IbvflUoflX+MLOMJ9OSQbdUmKklZ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Fw76ZqY3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Fw76ZqY3"
Received: by smtp.kernel.org (Postfix)
	id 67800C4CEEE; Mon,  5 May 2025 16:58:15 +0000 (UTC)
Received: from relay.smtp-ext.broadcom.com (relay.smtp-ext.broadcom.com [192.19.144.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76C37C4CEE4;
	Mon,  5 May 2025 16:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76C37C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 52E53C0042FD;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 52E53C0042FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1746464292;
	bh=r8I8dxX64lKddPXDq8tyZRhDh3NOo88oDYad4mGy5sw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fw76ZqY30z3N9stYbx9mRU7xlNZJB0drVVyLGKcw0GO79eZ4foGBynWajay/5+m4O
	 u1bbf0fQ81d8iX+/F6W59T86PZbgEMVBjsxXT4VLdfuA/CScKTNcTzrPrYSrWhWRcE
	 tunXL4oZjfWQqACUr1oLYkwV1xySs/WHeK+Ig3FM=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id 040A4180008FB;
	Mon,  5 May 2025 09:58:12 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/3] Broadcom devicetree-arm64 changes for 6.16
Date: Mon,  5 May 2025 09:58:09 -0700
Message-ID: <20250505165810.1948927-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
References: <20250505165810.1948927-1-florian.fainelli@broadcom.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-arm64

for you to fetch changes up to c9e81198a750870fcd806b853177108e982a1db6:

  arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names (2025-04-11 16:35:45 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree updates
for 6.16, please pull the following:

- Stanimir adds and enables the PCIe root complex Device Tree nodes present on the
  Raspberry Pi 5

- Rob updates the BCM2712 L2 cache node names to use a more comforming
  name

----------------------------------------------------------------
Rob Herring (Arm) (1):
      arm64: dts: broadcom: bcm2712: Use "l2-cache" for L2 cache node names

Stanimir Varbanov (2):
      arm64: dts: broadcom: bcm2712: Add PCIe DT nodes
      arm64: dts: broadcom: bcm2712-rpi-5-b: Enable PCIe DT nodes

 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts |   8 ++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi        | 155 ++++++++++++++++++++++-
 2 files changed, 159 insertions(+), 4 deletions(-)
