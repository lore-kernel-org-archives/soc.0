Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74082236FE
	for <soc@lists.linux.dev>; Thu, 19 Dec 2024 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734612668; cv=none; b=bbjm4OBpRhvei2ahEY29b/6uesQC31iE/NeiuenMq/XgRpGBThqM4hxkAboKfxZgAq5IGSPKKCX5DQZf0ju6IdbJAw/lcOC26zjcerKO/xhak+BTcl24G9233GjhFkaq2cOpzBgLtD+a/ZwLDGi2TsudUkTXHXtQT0iutoHSRGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734612668; c=relaxed/simple;
	bh=9elqFnY83jjuID90mH7jMSoJJkPbogCc+dd/5PLYQ8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t/bOMsjKPiZ0VZ53qa/xS+k/EwgxjiC0j7eMRZqK+RHCO0GKW9hK5MQkSvnXyiJ72Ps4QhpJZayjQphjWvCT4z4aOJj0RDF89iiRm6V3aq9FULNNo2Wtzl2UHaGi1u9N5ALm1gY7hpdzRyJ3zrgJbBgOC5BulPkXS5aZ/pkMDyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 53537C4CED6; Thu, 19 Dec 2024 12:51:08 +0000 (UTC)
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 67B2BC4CECE;
	Thu, 19 Dec 2024 12:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 67B2BC4CECE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gentoo.org
From: Yixun Lan <dlan@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>,
	soc@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] MAINTAINERS: setup support for SpacemiT SoC tree
Date: Thu, 19 Dec 2024 20:50:41 +0800
Message-ID: <173461125325.241921.7669060101424869020.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
References: <20241028-00-k1-maintainer-v2-1-272c9834220d@gentoo.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Oct 2024 07:04:00 +0800, Yixun Lan wrote:
> Add myself as maintainer of SpacemiT's SoC tree, which
> suggested by Conor [1].
> 
> 

Thanks, Applied to SpacemiT's SoC tree:
 https://github.com/spacemit-com/linux/ (for-next)

[1/1] MAINTAINERS: setup support for SpacemiT SoC tree
      commit: f187e72262c3245bc032a1a0f106784fb8562a0b

The for-next branch will be sent via a formal Pull Request to
the Linux SoC maintainers for inclusion in next merge window.

Best regards,
-- 
Yixun Lan

