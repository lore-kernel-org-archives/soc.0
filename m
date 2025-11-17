Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9AC30103D
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 22:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763417982; cv=none; b=aZ0aNNkCes0AMu6YlrmR067Fnc6Yav5spxJHL32wOHqToht2RX3I1kRn5qACYjgAiqbtS4P7n/9f3TsmHZlOOGgEJA3YXCZ1GE3vyHwa2ZsAuifqeE03CaTuZTOjqidgPMD7ccgMbgwOB06tr0GvDWvkh9mfRPqw9rRgxXlMqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763417982; c=relaxed/simple;
	bh=wkAoUUijVbiYh9/wLPdlOR58L1hohxtb9xVTYgMintk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Eqvg8ONYqZ509FaxKnz9z3D14PsZVeN5tOLIYRrA/hlpunUSo6zWvHLx9pQlmeo7BheuePNFMffy+kXmgQax0xYnyp12P2Nye6SRpReu0RiOzflRs1AYTneUV/OzsRDYTXfqpEbPtX+QFzOK2yYglJ607z2A7rKRlj5LbzzGKzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=jUoaWV8Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="jUoaWV8Q"
Received: by smtp.kernel.org (Postfix)
	id 98B34C2BCB5; Mon, 17 Nov 2025 22:19:40 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF41BC19421;
	Mon, 17 Nov 2025 22:19:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF41BC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=cFXBwc+8LQYNjWcwa74mUOCAwNkj3U/HZwRWUStzKFg=; b=jUoaWV8Qw40ZEHQqcrTKd5gT0X
	PsY0G6yV8dbKrV/05LIMR45zNnUL76tW1TOgVVC0YL+DTBIcG/U+Nm0qzz9KlPa6SO6QaC9ki+SCs
	QUdj4Jczai7D7FyN4P0JhEp2gdkPXZA+I/iaLMDg7j3B4/fu5jx9/8M4QqIRXzPccmijaEt8YnSHl
	NLTv2wfbHy5SkjzvYAJFshxkgCXZUllQJzjDFGZfD/f8DbLa+/wGy1MuH/UrhHOMum5J+ye81WRCJ
	wY2KRm5vU6J83oP0nejxp+K9nP2QCO73LEjbxpUtpyfZUNMEXIeJGFn6+92mZLzONjEeVdGsFBfZy
	sDBOFYJg==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7ZL-0001P4-0D; Mon, 17 Nov 2025 23:19:31 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip defconfig64 changes for 6.18 #1
Date: Mon, 17 Nov 2025 23:19:30 +0100
Message-ID: <2101096.usQuhbGJ8B@phil>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.19-rockchip-defconfig64-1

for you to fetch changes up to 60705b039f960378bb2a0a844f9378646bc0c6c8:

  arm64: defconfig: enable rockchip camera interface (2025-11-16 00:34:27 +0100)

----------------------------------------------------------------
Rockchip support for basic camera interface (CIF) and Synopsis DW-DP
driver, as well as the CEC extension to the DW-HDMI-QP driver.

----------------------------------------------------------------
Andy Yan (1):
      arm64: defconfig: Enable Rockchip extensions for Synopsys DW DP

Cristian Ciocaltea (1):
      arm64: defconfig: Enable DW HDMI QP CEC support

Michael Riesch (1):
      arm64: defconfig: enable rockchip camera interface

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)



