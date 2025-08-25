Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD9D1CD215
	for <soc@lists.linux.dev>; Mon, 25 Aug 2025 01:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756086555; cv=none; b=sHFkE7y6SLYj6jICEYdDIgOW8BnwbZu4upF9/J93QhfYLJh7JwuixeVsU1jbliSQ0VYIRT9TG20ucJyqmu7bjepNfTPhA9JsWdRCO8VRyFVlke6yOg5TyR7kPEg797M4KMkGiR4VlaEUNjwh9Nowdsl/SzvHCw+DhDIsS1TAMzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756086555; c=relaxed/simple;
	bh=+Bazrsue6wlJTu3VquUcIht731zVlQD5a48SpjdZdyg=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=jXDlZ/GJz6yyElEzyoLVMu4//qtxtRE+/IWGvwKdSvaJoTnXDYWycSSQOtvjvgI2IG604m1I83RW2tUPKjsM8M4+4xR1zq8R9grSC+zfUCzexSY2+Sa0p+3Zk7qzvxPn5siITVJVUnPINht/pG2/jokDQvD3UuCwlFyaUvRV2kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=BwNiLTp9; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="BwNiLTp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756086551;
	bh=wgnOb3qWz6wBb9vyKuCsG5rQeCBlBsWJND+E1w6iSmU=;
	h=Subject:From:To:Cc:Date;
	b=BwNiLTp9/zW5Dlir+EesRuR54/NgyA3gVrB1YA7dvgsvYUnl8rRHS7ScuKlRNlItE
	 MhTgoFefOXbypEA4vR1CT/V0IqLTcLi+ljrRV8fvGKxCgYLETfHSRQSXSOGqq+d+Aq
	 184CDgl4BwsximKIqixoYTEH+t5iyYDuwIQiKllcS+xr6gulQgmBo+6BQfP9nRbv5/
	 qMbjPlLY1xuL9iSO5Bs/2/g2N7rTLvtLp4Gh7EfgOcl5y8XQlnQrKRB1YKXKCoT6kk
	 fa5rkcyjhy0KuuXdPiLHXtryJbqan0qASeR/bPgjgjPi3qUOQ6SfsljO62UMKI7LTc
	 9f5R5fbWaFdlw==
Received: from [192.168.68.112] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BF056443C;
	Mon, 25 Aug 2025 09:49:11 +0800 (AWST)
Message-ID: <5e7e5d2cedb3bb232420ad720c857b95d8c02f21.camel@codeconstruct.com.au>
Subject: [GIT PULL] nuvoton: early devicetree changes for 6.18
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Mon, 25 Aug 2025 11:19:10 +0930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hello SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585=
:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/nuvoto=
n-arm-6.18-devicetree-0

for you to fetch changes up to 7686b441c0ad921211b0a69977bad746d18e4b33:

  ARM: dts: nuvoton: Use generic "ethernet" as node name (2025-08-11 09:38:=
03 +0930)

----------------------------------------------------------------
Early Nuvoton ARM devicetree updates for 6.18

So far we have just the one fix from Krzysztof that switches some nodes to =
use
generic names, as recommended by the spec.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      ARM: dts: nuvoton: Use generic "ethernet" as node name

 arch/arm/boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi | 2 +-
 arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

