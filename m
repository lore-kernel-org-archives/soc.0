Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4925838CFF5
	for <soc@lists.linux.dev>; Thu, 26 Mar 2026 03:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495567; cv=none; b=Z0xLjtG9DGwZWUuyTp63pb/xSr/BuoEQ90KbcrrhgNpKQJqRnep+QLvNtqDwse/qpudO29l3VdIsYWNzZ/lsjXfx0+6yOkMZH/Vzco6Bz65QdhLt/XbZREvYKrjzXeEFnCvCcD6VLENkbDtlAQErXrNrnehjGaayXW6n26dEN70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495567; c=relaxed/simple;
	bh=XPyQn7AKeRzYI+PxKlQqwAOzT36C54xYudlCXZFa68o=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=J3+kHWnIeGl8t1jzxZXXTB02ww/m0nB07ifudBiqBUk51yWyrz/wy8n+FTQxeuDA9xTqdYXSMLVCI7FcOhdE8vLpxOSu8q9ne7MO985LbB8Hz/qgFdW+1GveSAbDVEUBKfaKG1mu6mkiZONlQyJBCCCLPJ6VvuAV9y/QB/wymaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=EOR0wMes; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="EOR0wMes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1774495564;
	bh=eB+dLsG5tXfnyNIFXfqQOMNtjQr+D5glJc3VgXXmzsk=;
	h=Subject:From:To:Cc:Date;
	b=EOR0wMesdSerzGer9QZ3uJSHa96ISOkKd/JLd+h6xt0wovzpoeic096Drj2uVMemy
	 jEQjI7RRhvADgnBKnNloQuEClQpWoSksAjGnA/cQMtHh+0FydaCtHbhvsyWvg//XUq
	 cqGyGvWV7ZOc0Z9n0pW2VBIr+ALXaOrlkLeFjuIMX49YMmIvpm0ApWprGbV0MlfMv2
	 nGVy4g4HkiChklNJ0s5q2b3NA1ya+j/GRxoZxPVD3nzvS9pQGDwrcHwQpOG1F6Rt7C
	 kjf2pu/yAxt89bNWLqHmHeKF1NlA86DgRZnLs/JueF5onfqBmDFz0x1WOWqj5BsBJH
	 AUo2McuK1U74Q==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 3F53A645CA;
	Thu, 26 Mar 2026 11:26:04 +0800 (AWST)
Message-ID: <8d8d5f9f7f8ee803ab14c4b3405d74b305a2ab81.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: first batch of arm64 devicetree changes for v7.1
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Thu, 26 Mar 2026 13:56:03 +1030
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

Just the one Nuvoton devicetree change for v7.1

Please pull.

Andrew

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm64-7.1-devicetree-0

for you to fetch changes up to 6ee3f20368a4a6198988a54c1a744cbae1354359:

  arm64: dts: nuvoton: drop unused syscon property from watchdog node (2026=
-02-23 09:43:36 +1030)

----------------------------------------------------------------
nuvoton: first batch of arm64 devicetree changes for v7.1

Just the one change this time, dropping syscon properties where they weren'=
t
defined.
----------------------------------------------------------------
Tomer Maimon (1):
      arm64: dts: nuvoton: drop unused syscon property from watchdog node

 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 3 ---
 1 file changed, 3 deletions(-)

