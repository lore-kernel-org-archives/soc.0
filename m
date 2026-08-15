Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3758B3624D3
	for <soc@lists.linux.dev>; Sat, 15 Aug 2026 08:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786781760; cv=none; b=grmo7PkFMt7ifVovPrfFyaY8UMSqdOYJ0w2jYdR10Oa7p+MMfp+N2zj7xEfEhxxRgpNuAlsDhEMJRkGmujOcibl036MtZd23rYTOcHJNoP4BsFMUF2r7rH/16+CW3nhtOEtyp+5rVx5eWOvwDd3LIAa4xdj+hBpaTLJ894zuIjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786781760; c=relaxed/simple;
	bh=+1IgkPjZHGkPi8vK4Nfg6sVq8MqjK/EMzr9iVLhjFr0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:Subject:Content-Type; b=s15WNhmoHDFVhZ5jNatkThdFJaM/A+rceD8zKQr+DzFKOhP3eW0U6k2LEuSidzVbPauXcR5npnEhYRCkjgs1MaqVPULMmCzmiS0dflvSr/OnJXAxocOo8doxr+pRHFhYD3LNgd1wU7vfYPnZEjwPfSCD3RnaoMFBGdkfwxwBOeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NOyELDQ7; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mA8zKdcw; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NOyELDQ7";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mA8zKdcw"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id AED0E7A01A8;
	Sat, 15 Aug 2026 04:15:55 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 15 Aug 2026 04:15:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm2; t=1786781754; x=1786868154; bh=uT
	XfL04+7M6PFf6QMhYjfaRkbYuuslMVuPfvHfO9194=; b=NOyELDQ7sV4fP2vUzc
	bWu78TVLDS/1DX2bPr5CAwxzJgAHjy3O192dbBxhqr/tX6jrSirZt2cZ3jhHPo55
	tSK8Deu8fJTZg0umd2UJ5gelrp/9uJFm/LzHAT3r+NyTWmjCfsHRDcMxasrY/xie
	Vr3S6Eyupj0t532dMSctzAoXMuze+RsKkQYMDQeafqSsiGZ/rMUr+dJ2uPge4od7
	/1e+KOFVS2RZGU+4O4MKpj28REVx6+0liZ/MKClIYmE1om/MOqLZ3IpTHQC4Vx78
	/fUMlx4XDTaVFI4u1FefZSgCyrq9M72drOkaMO0/7JDC9SMaB0I0uGjtwIbRVue+
	sh9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1786781754; x=1786868154; bh=uTXfL04+7M6PFf6QMhYjfaRkbYuu
	slMVuPfvHfO9194=; b=mA8zKdcwi6KE7MPz1ezb/wyKgl91c3AB9HbfVExl76pD
	F5+a+RHqjnpMZSM1ZVwXvSyhKGPLfKqD2GkTGxP4PNQy0VhiNtSQdULCW8QOCbZZ
	5DQxrm2+JKcEuK9LDeOGkGB6XjvqsFio1bLnAg4gtCmh/e4KyatxllmxUesnD3De
	OvKPF3DibaZ2LEqZGaNKiAx7K/XVtZ3ICCytqFz8kAPGHkBYItbhbQiGZotKcv5l
	FocKpI7aeUjYtKDOBVPIYgS7O2akijDtK/jU9wJdM3h9Vhoe9JUh9acROEuyjlSa
	we8un8KCxRyL89H2Z1kYEXp3Cl26Jd38cuPvDwtqQg==
X-ME-Sender: <xms:NSCAag85bDLDwXahzSMwCpI9Oy3v-vmxDJqD_kbI9TC_iiJLgmPcpQ>
    <xme:NSCAajiZuirQN-OzFh4MC2_-IOiu1CQ_PrNLA6Cxv-TXMvIhW8k4NXI2h4sgBVpKZ
    PNzhciKGmbxel0YlxvwlTslixEhaNZW4VrEEfACdGMOfrukbklLa6I>
X-ME-Proxy-Cause: dmFkZTGUT+E/IH3S8Sa45nnjiVsqDd16e+pbPfxGZnjdGaokIbfIpSQJW0WNC5YwDiTrd1
    uEBsptyMk9ouzswyZPBagl0pd8MzKTpRVMfLQDYNY7qQHbdYW7r9Vp6q3WLifz2tOZLxZX
    m9+tspUe0zXc9H3ENZVZy2GGNjERoqCQdFwfUqk5gJ4vT66O7KeXZxnSeUk20+V0XJa44i
    hQSnWgNAdihi2DFhAUjjt7oi2ptEU6Gmmo//+ALWiYQ6mWsfEwkynpzv1YdvOUDH7fRvyY
    jxADPlU2Jsvoze4VyYEUsepuWSxJwhGTO5+casTMDJ5gIi1sIkM4rHsVG59h4jGz4WKnAv
    qbRD0Uz7KifKHfKj96kZpD8oGG5oLlIpO666xgznJyZW7VpEWw5HDX9PFe68wK5b6/BFwp
    nDrzTSZwzGJrxodiZIG4G3g3TD921wJ6CqTrColZSkxBMjFUJm0e9Wqxe45Mio5iawM2Fk
    m0IR1aGdyTxqq1U9jcd1rnVG2aoEFe1WRI1TkhODjIrSsugQohZe9ASuX1NZfSLNdKR4vr
    IS9VXHjUJbZ6HaGvXNzoBcWvjMfljiKw8evACQ+7aZkSYJaxEHDslF5P4po9P4GGmwJDlw
    nmBagjVoHwMljC6iq4J1OxshHzwHTfp89xXddxByTUmQLoC2YPiPRZ1+bvwQ
X-ME-Proxy: <xmx:NyCAaioHKYVf-h4EryngrxJj4_LUzoLbEpewTCLzvHTRUxu8YTJJ1A>
    <xmx:NyCAanivzLBmE3aqCr77njkxDfrdFgJ5Y3k51J3h2vkx3cu8S48ZYw>
    <xmx:NyCAavgYf6LlHD1rJfOldt9gNWY_oLS3puSxXOOHkMjFrXGotNnMRQ>
    <xmx:NyCAatibzfrPIonDaj88miIzC5EKyAl-vjBFMppMvnXcFFPXOTivLw>
    <xmx:OiCAanwdiPZE4sVJVvDBeiQh2k4bRlnlXZBZvu641DTXG0sk5-Upnm8g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id C21CC32A006F; Sat, 15 Aug 2026 04:15:49 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 10:15:49 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <308796e0-962b-4e8f-bd2a-af5be9cf15a9@app.fastmail.com>
Subject: [GIT PULL] SoC fixes for 7.2, part 3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.2-3

for you to fetch changes up to e36c0670d5ebebd7dba493f14966051f354fbb34:

  Merge tag 'tegra-for-7.2-arm64-dt-fixes-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes (2026-08-10 09:38:36 +0200)

----------------------------------------------------------------
SoC fixes for 7.2, part 3

These are three last-minute fixes for the 7.2 release,
though nothing alarming:

 - one error handling fix for optee firmware
 - incorrect i2c data for the apple M3 that was added in 7.2
 - a boot time warning fix for nvidia tegra

----------------------------------------------------------------
Arnd Bergmann (3):
      Merge tag 'optee-fix-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee into arm/fixes
      Merge tag 'apple-soc-fixes-7.2' of https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux into arm/fixes
      Merge tag 'tegra-for-7.2-arm64-dt-fixes-v2' of git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into arm/fixes

Jon Hunter (1):
      arm64: tegra: Add EL2 virtual timer interrupt for Tegra194

Michael Reeves (1):
      arm64: dts: apple: t8122: Fix I2C resources

Mostafa Saleh (1):
      optee: ffa: Add NULL check in optee_ffa_lend_protmem

 arch/arm64/boot/dts/apple/t8122.dtsi     | 30 +++++++++++++++---------------
 arch/arm64/boot/dts/nvidia/tegra194.dtsi |  2 ++
 drivers/tee/optee/ffa_abi.c              |  3 +++
 3 files changed, 20 insertions(+), 15 deletions(-)
