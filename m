Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460C4382F18
	for <soc@lists.linux.dev>; Wed,  3 Jun 2026 01:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780451733; cv=none; b=FwRrVaBSnkWkZy+dN+E5YtR4MhlJ6esmgGZG5hCuTlMhPi2k67bqfaJ0jtiONchaKVNlSwEFDJ3oWbnkHLpF5qoNfOJMnzWRQSTCMfxyhOT2rhy+3nxhWyW6hYMXsyutyqvVg7KFMjt5VOzZak25LVcKG2CAEZrD/brLBIF5XmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780451733; c=relaxed/simple;
	bh=DJwqSdphS1rp84oa6H/3bmv29GRu+T4mFlHuZMb0rpw=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=qCwsVKIO3jVNRQTcljUaQQZD30K0Sx2F+D1ktG2aYa9Sn/1ig8lh+eitvCE+Awk7vLCRO230lf2JvNRJUjpD5XwPJXECISEcqHnR4qSNKj9v/zz8LoRH1qw22Xh/yqrJfdGuAjCfGYXkpKrqpZZKOAnry7QcuWGMc635kVKrfGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bCn2zoTl; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bCn2zoTl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1780451730;
	bh=tx82nXcNwoZBDaSltchd88wfYFzbl1TA2nlVTrEqhtg=;
	h=Subject:From:To:Cc:Date;
	b=bCn2zoTloqOxxDig5JmDUJm6foeRhBtzOX06v24QuFpeEjX86wYXplBnnTpBJPJfk
	 ih1moDj6u1KxTKfjvzvsxivMT6Z6NWmGeAvVsWM0ujjYUrseXUDfxszU6lg5YSXDaV
	 OvPbBIHLJZxAP33hcJOscqqQxTFfYEatcUIG93f222aVOm8igbNg8LOJMEoR0OXYxi
	 S7Y+FwoafaPjMtHQPCSt/Dhvk5CwhDZJ40NoP3qpw6nPJpmK7CJnqX96gA0oTzyVPS
	 5L19RZvH4Qrv9rUOIdrNLqRo5qXDYG45kKZdoLaxUwk1BMH/lFw4U+C5qVgYilnpc9
	 GV8o/lchiUpAg==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 302CA60087;
	Wed,  3 Jun 2026 09:55:30 +0800 (AWST)
Message-ID: <0743460993783da99c633acbfb84bfe065cb303d.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: First batch of arm64 devicetree changes for v7.2
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Wed, 03 Jun 2026 11:25:29 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-7.2-devicetree-0

for you to fetch changes up to eae82b6e8c2399892e145195cae9aaa0b960fdaf:

  arm64: dts: nuvoton: Add Ethernet nodes (2026-05-18 23:18:01 +0930)

----------------------------------------------------------------
nuvoton: First batch of arm64 devicetree changes for v7.2

Just the one patch adding ethernet nodes for the MA35D1 development board.

----------------------------------------------------------------
Joey Lu (1):
      arm64: dts: nuvoton: Add Ethernet nodes

 arch/arm64/boot/dts/nuvoton/ma35d1-iot-512m.dts | 25 +++++++++++++++++++++=
++++
 arch/arm64/boot/dts/nuvoton/ma35d1-som-256m.dts | 24 +++++++++++++++++++++=
+++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi         | 52 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)

