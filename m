Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424362D2496
	for <soc@lists.linux.dev>; Fri,  5 Jun 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780672834; cv=pass; b=aOnziHpTOnRKBXffu8kg4oKnQOtWm/kFw5FZ2niku4gs+80n2/ZgT5LQHI8bqZcORUv0NAghsjQfP9zAg7dhi0mh3IWApgNvu6KbtzdYQkAmmXW+jVJTJlegmm/R8+dFSYTUReKMIuixq7gBcccfy+tMFesmLpgQxKHzKOpAw/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780672834; c=relaxed/simple;
	bh=UeNVA1mvHrnMBzIMZjO01djJdBgo2zGd+enzKhqwxRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ucqYrr3YOr5vbOl+fHSsySE6CCCh4atdxNI7Thj+fVg/JT7y+ro+a9k3y+Bsk7g388LsRiuFosMF7/C3XtPmVZ46nFEeBEHdOdkjTdapmC5c1OuNNDP7Z28/bLFFa3PAF2zrKUj5HlovO53aZUYbVK95YtQrDtBrFRs7k6ho+Qg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QkOa2YZ8; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="QkOa2YZ8"
Received: by smtp.kernel.org (Postfix)
	id 1C88C1F00898; Fri,  5 Jun 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780672833;
	b=ZI32NUNBsI5YsBH85e+d290p1mf+QzHqFijYHiLgl4Yv7x9Y8LRPYwdcWwEtd6daXGPk
	 jiStlT26KuosBgAE4Cwxa5FNKoJFPr5bIbgjiL5GaM8afptbD2033mPk9PfpFAJe6gFsp
	 /e3May5MKWbU/hCRx+CLypp9T4xf2ufLJYpx+aX0TJFhP/JYTGtBU5r/xGoC69BX87mVn
	 B9yNgPItYxRgJnEMwRfjpocjG1ppO1HfE0XXt6JhMmWBedPzNJIX3bsLwIxFJhP+kEn0q
	 ceCywobJdIpDyRfUs3L+ZXJ9Gjoq9HABjNktZO6osnS8d7Kr/R3megKwfiIA/moE/Fg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780672833;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:MIME-Version:Content-Type:
	 X-Last-TLS-Session-Version;
	bh=bTvm5jVvvuCGHXiCCu3K99as49t50DTZUW0kkqW9Rvw=;
	b=cgFClCKEiLXHG4UV1VgRIosXQJk01k2GaLGhkrsDW29gOr7MXuf20ISKgUix39KfMLtj
	 g990XcpqLZww6vQunML4oic5o5QLW4A1flIehBsN1iX7W0CP0tinY8Bjnd++y/pQ/iO7L
	 xAnfg8xltk1cuEkEChEUcQXYv//lXHAR67+iTKKgOFO92UgLNbpIluqUg7hQ9VDAJxZ7F
	 gJXnt9wSJjli6samRfEEyvqwnuRuoRN2DYJB5JRZkcxUxWJujnmwWsDoaQVptGp5863dg
	 pWHAMpetU0XiTF8FjvOM/Zez9lJNeD+Hj3bME63TtZRwSb1bE51qrNDYfH9kJgGxyLg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QkOa2YZ8;
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 46EF11F00893
	for <soc@kernel.org>; Fri,  5 Jun 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QkOa2YZ8
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 46EF11F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F308D4E40835;
	Fri,  5 Jun 2026 15:20:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5F4A5FED1;
	Fri,  5 Jun 2026 15:20:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5EFF106A2500;
	Fri,  5 Jun 2026 17:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780672824; h=from:subject:date:message-id:to:cc:mime-version:content-type;
	bh=bTvm5jVvvuCGHXiCCu3K99as49t50DTZUW0kkqW9Rvw=;
	b=QkOa2YZ85E51nzSVc7/1MGGgrDBSCOwI4619e9+pLMEznCkUKyCYSJm0n7e3bdwGZzN8Jq
	Psbhe0NxmHLVDKabRbTOgZHfpEXBRGRRfqun7WYDp/nIA+22zaFBKDvZrsxtZSQVVa9SoO
	gFlhGrbKgKQMH44SPxxk1liec8kZYCMfdJWoPdppwcIne2HNub/OXLXGIRZk9KCtVUeEFd
	FHd/KPgZn3WRbyT8O+EX5usnDwPCj/v+HLr9ga3rzSOtt0DjL9WDUbXNGkNUjh6Qth6YPZ
	0t+rdeqLfs6VF3Z8MJbwdGS7AJA2+841BhfOwHsZ5muzOOp8Ox/yqtcnP/YcdA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>,  <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v7.2 (#1)
Date: Fri, 05 Jun 2026 17:20:20 +0200
Message-ID: <8733z1c8uj.fsf@BLaptop.bootlin.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3

Hi,

Here is the first pull request for dt64 for mvebu for v7.2.

Gregory

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-7.2-1

for you to fetch changes up to 5dd98e0389545b302b0c46cef2264b5b09c01677:

  arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent (2026-06-01 10:04:36 +0200)

----------------------------------------------------------------
mvebu dt64 for 7.2 (part 1)

Mark EIP97 as dma-coherent for Armada 3720

----------------------------------------------------------------
Aleksander Jan Bajkowski (1):
      arm64: dts: marvell: armada-37xx: mark EIP97 as dma-coherent

 arch/arm64/boot/dts/marvell/armada-37xx.dtsi | 1 +
 1 file changed, 1 insertion(+)
