Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D3519ADB0
	for <soc@lists.linux.dev>; Sun, 29 Dec 2024 23:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735514921; cv=none; b=gDTthkHDomfJ36JcBIzPy2QmMO3j9UFtBrtJU63vvw/2dOtUS1wmeNTqd6hci60938Se7+/vG+JP/jzsuisBp7ODssvk6WeHgUgK3IwIS/SOwx9wt2VFcwW/QntDv3V19XdR/fmhrEdcv5493mLB1IXJg3F3bb9T8MP/RX7NFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735514921; c=relaxed/simple;
	bh=BEQ8z1ut2cQHekD22fD5Tb5BXFAjsP0xhOK/q2xwRf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ImfYksjCsJoT0ZX/2WA0qxblFTo3p30EnfL5W4S5tugqZShRcI3R5k+KEyExjDKthjfMzzBOuSF8R+8Vb8RDG24L6nuzQsXItw1wV5MECB4zvDUpWxG0/tgd2Gyf+pglVH+PHUWUHD7utC33seIRUL3rNB8Aov6W0wUGvOdcGsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b=bDu/XLn2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pdp7-com.20230601.gappssmtp.com header.i=@pdp7-com.20230601.gappssmtp.com header.b="bDu/XLn2"
Received: by smtp.kernel.org (Postfix)
	id 663ECC4CEDE; Sun, 29 Dec 2024 23:28:41 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9E2E6C4CEDC
	for <soc@kernel.org>; Sun, 29 Dec 2024 23:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9E2E6C4CEDC
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=pdp7.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=pdp7.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165cb60719so111820615ad.0
        for <soc@kernel.org>; Sun, 29 Dec 2024 15:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1735514919; x=1736119719; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Umzb/cpVkBSMsf5TuOtyuUgveg3g8v8YPbqtINmhT0k=;
        b=bDu/XLn2ruq109JqE+mLK3gsfezrxE4/Yss+5TEC8cOKFDFXTnYQ4ImBYyJ2lmV2eY
         dkF5+I096h6pGl+KjsVIyNa/KFdM5JjLmGNEEKo5K7Umm/G/ZzJhgU9PTrkHFyUesmY5
         v7SdU3ybWVd70eW9gfTyCl2GxmQbp21LHppP9Wx0KfSdsPo5qXwLWzBla66NEJLT+GRh
         LWVbjg+bVPLkNL9HQXvDR8TNfjxXbTfp2nXYpQk4wQMYGXC3zOfk31/dvPF70+gjnjqB
         bz085g0YZw7gB4roVAerw5nfO6sJtOBBUqNiaPUwgFSSKe08qi2J3abSqPXOLniYyGw7
         P3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735514919; x=1736119719;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Umzb/cpVkBSMsf5TuOtyuUgveg3g8v8YPbqtINmhT0k=;
        b=nnw4k98pJmO4rnWMZ46lebNUmHRjiAk5hYlAY+FPolpTmsaNhB+pNv0b0Dmlpb98IB
         uvUZ84Q8VTZm4arhKS3sBOO7gD4AI7r3FTGbbRoSl/2X7VgtVk/M7PjGOBDF1Zos/gub
         xBobnko+znGf66z/otjwyrxCaFDCAOUedCfu75Dbxmjhf570hFSAHu8JlWLBMfhr0s6+
         xJYm6HYHQVq9+5gCBezLnfhtQlPorc4mAiqAcPB97bvXviNCoxLu9q0THB7d5M6VODoB
         sXeSSTx00Prodai9vRt9xrxoeu5T1yMr9p6hsjxCY2KShDAibRMGi92ExRztKObwOkOd
         dAkg==
X-Gm-Message-State: AOJu0YxqKEGVtc5XvfdXkQFJINJQxEok4u24q72J0BDhTG/+Cc7HyC/Y
	1ipc33ydb08MNBEfyQTklH0AmmETHKh6kRHjyr1hc9mYJPrrmoPG9QI0WU+EJ6TJQYmA4jmz3/2
	u
X-Gm-Gg: ASbGncszwQpjNebiMFnABg5bOqiF+rdqmt6xJffCbu/YUzX2YJfnxhzEkPujsMYUlKW
	Ug+VnoBxe82XulpzrWPMx6dKfoduOVwgGxKz4awLWPEJxaDVm/JK0vNlca4HlZlEsGNBxRP/QUv
	QjBLxnDMLMRQLv9Bx0Ugp5zu72UUQsBE0ek6gUPJhZNP9JhxxiawNHylKKvzHjLy8Co4RhQMZ4P
	mFqjJjDy+2gdB2U//gSPQN5nS21XlNBOxh36ZCeV8masie1KLoQ4TAJHxO8AsEHkg==
X-Google-Smtp-Source: AGHT+IHldvMkQufBuQX10YCQFp+ijImIhHav6sI7E20XU6PffBB8+yEkV3TBxa5dVe+iW9flE+V8GA==
X-Received: by 2002:a05:6a21:3989:b0:1db:e3a2:ea47 with SMTP id adf61e73a8af0-1e5e0461d58mr55130767637.14.1735514919066;
        Sun, 29 Dec 2024 15:28:39 -0800 (PST)
Received: from x1 (75-164-218-15.ptld.qwest.net. [75.164.218.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c133sm18592573b3a.183.2024.12.29.15.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 15:28:38 -0800 (PST)
Date: Sun, 29 Dec 2024 15:28:36 -0800
From: Drew Fustini <drew@pdp7.com>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.14
Message-ID: <Z3HbJPwZB+siJuAR@x1>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arnd,

There is only one thead device tree change for this cycle. I have run
W=1 dtbs_check, and it has been in linux-next for over 2 weeks.

Thanks,
Drew

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git@github.com:pdp7/linux.git tags/thead-dt-for-v6.14

for you to fetch changes up to c95c1362e5bcd90c45987828bbef02236d181ffd:

  riscv: dts: thead: Add mailbox node (2024-12-12 20:07:16 -0800)

----------------------------------------------------------------
thead-dt-for-v6.14: T-HEAD Devicetrees for v6.14

Add mailbox node for the T-Head TH1520 RISC-V SoC. The mailbox bindings
and driver were already merged in v6.13:

b2cf36e4a2ac ("dt-bindings: mailbox: Add thead,th1520-mailbox bindings")
5d4d263e1c6b ("mailbox: Introduce support for T-head TH1520 Mailbox driver")

Signed-off-by: Drew Fustini <drew@pdp7.com>

----------------------------------------------------------------
Michal Wilczynski (1):
      riscv: dts: thead: Add mailbox node

 arch/riscv/boot/dts/thead/th1520.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
