Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743212F25F0
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 06:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785824174; cv=none; b=YgoYaelF5+0XDCIHeVsK12XHAjKfF2PybdWltvKIdLhKm1ITfO9Km6LvHZ5qG1vmuDJpu1I1V37pZF8JH0StLS+xZP8DItNErftmDfbUAY6Xm7HnisHl67CCKIrUF+G/DQvdz1ns5D2eUXDMGMmfidLkGORBElyavCk+ovHkAbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785824174; c=relaxed/simple;
	bh=aFzQdDJzIWWUJz7bVQld4kIt+mujSxv7BwyXMVb5WWA=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=szSjpba7I/N4WLnm1veOG74bZtzS7o/JrLvIPBfXZMtPq3+hH8697w3N+iCuRjJ8aMePR5ff10EkvJWEl6a1ZJ6iI037uM9M040uDvEFuTxi0EOVD1R1y9prF/5ZjYzsCzy8gv6sSdumjEmN3uXitbwCctbETE+GOOsA0K3+w/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=eusIPTTu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="eusIPTTu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785824170;
	bh=cGFVWEk/L87zAQqYZdNMd8YoKosd5LHXs3b+GVvAT0k=;
	h=Subject:From:To:Cc:Date;
	b=eusIPTTuYbmRVVvOhrqMqqRgdx7nr8X+xGcc+Lb5c03llC7uSJ1VRV1Gq+zjBt4a9
	 jnII96cWyimPkHJKRjtcTIoEUUaLjsQggOKNyPcWA4/2VLqGLhZdF528vIM/SqHK4k
	 fFgj0XJvxwZn10h0uA3QwNZdIS4SISqwHQHKMjfEZqqjYAoPns3GfrTwNXLDB2zvkY
	 8bGTVTtO+oZk+A4+63X0XPkvtdFl0zn8Uox8A/Y998qL6LFrTpaTWv4mpXR7Wyzoiy
	 nHqYHX4o5fooh9nd36GSs4tVEHlvrej5DveWgF14izzCNlu/7X+QCI8n3V56+8BcGN
	 EcHnt2wayulCQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C43ED655A9;
	Tue,  4 Aug 2026 14:16:08 +0800 (AWST)
Message-ID: <7028fd175c1cab44bc7696b5cb92282180e1f0dc.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: First batch of driver changes for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 15:46:05 +0930
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482=
:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git tags/aspeed=
-7.3-drivers-0

for you to fetch changes up to 244b7f86d60544c99f6e3774fbf0e1aafd3a30f4:

  soc: aspeed: add missing MODULE_DEVICE_TABLE() (2026-08-04 13:46:20 +0930=
)

----------------------------------------------------------------
aspeed: First batch of driver changes for 7.3

Just the one patch adding MODULE_DEVICE_TABLE() where it was previously mis=
sing.

----------------------------------------------------------------
Pengpeng Hou (1):
      soc: aspeed: add missing MODULE_DEVICE_TABLE()

 drivers/soc/aspeed/aspeed-uart-routing.c | 1 +
 1 file changed, 1 insertion(+)
