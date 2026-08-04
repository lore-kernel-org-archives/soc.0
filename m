Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA47371895
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 06:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825061; cv=none; b=MJ73TwjzFYE9R2F8i4rNuPpwF9Xhxrc6lkgGJxbnFc4EZ6j2NrP63jr9rO2ECRpb87aSpqVIGjyAKIylGQFhhyJH/GYGO7n+CuV8OI6CcMHqIpW1Fm5KyAT02dXKcuanVi038NiVQrAxoSuzBUpQKpEYekGwoh3SsqbJx9nvSj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825061; c=relaxed/simple;
	bh=3ffyHItWstsPA+alSvDy66eeNg/wknvEdZs03Y0O6I0=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version; b=eh3Kn/JNSxiNNCqA2yxa2m55h63zQaYB0cWDBdH/VPS7l9aUXliRrmK7DOJlyLG17VG5+Qlz6GPYlsBBI3A6F6rXVMqZJE2rvcq0oTaA/CQxHlp8MxvPPylonAZFdcLkE7JJXqfH+k3TUqIUmpzg9lEE9TDdzRT5RcdnRaD0vQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=bO5aAQtk; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="bO5aAQtk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1785825057;
	bh=gi9d0l3rgCR+RUqTo7TMdUVuSdReZ3fEmqQNtlJwxzA=;
	h=Subject:From:To:Cc:Date;
	b=bO5aAQtkO8KBjSXY3sQKjQsvvIPlcQi9EjRM33BJZ/FYZYbrvwA2HU77tMNG9Tb4Q
	 0jcATX+R9Kwvu1y07YpMt/7HHYAFPDHph3DHWaVqSoD0few94ATqaY1aU2hdnUN7Z7
	 iyjB/b4aq6YpC1pWNk5clF/tkwwyNPXi13oXEeIgNHFESD8gnps7UhbkAUfo6XZhfd
	 eEhJy28ZV4suEgL8XnddRO+3+fFpbLvSJj89JuFSnDDtYiUl/310Ge7Ik8FSDZ4dMZ
	 1MbW47E2HVwiLzPW9qClezNNWXBCXXmdS8osHqMf9UAmwEEI06IJc1wwh6TZ+sy3g2
	 48Z63TvNBIUhQ==
Received: from [IPv6:2405:6e00:242d:870e:1a3e:8259:e4fe:6a28] (unknown [120.20.146.186])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 60016655A9;
	Tue,  4 Aug 2026 14:30:56 +0800 (AWST)
Message-ID: <cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au>
Subject: [GIT PULL] aspeed: Update MAINTAINERS for 7.3
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: soc <soc@lists.linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>
Date: Tue, 04 Aug 2026 16:00:54 +0930
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
-7.3-maintainers-0

for you to fetch changes up to 6cdd8cbbf89611da6c948d58daed1c53f4bf8321:

  MAINTAINERS: add Ryan Chen and Billy Tsai as reviewer for ARM/ASPEED (202=
6-08-04 14:06:19 +0930)

----------------------------------------------------------------
aspeed: Update MAINTAINERS for 7.3

Add Ryan and Billy as reviewers for ASPEED SoC patches. I asked both to add
themselves to increase ASPEED's visibility of upstream changes.

----------------------------------------------------------------
Billy Tsai (1):
      MAINTAINERS: add Ryan Chen and Billy Tsai as reviewer for ARM/ASPEED

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)
