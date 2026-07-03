Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAB73E171A
	for <soc@lists.linux.dev>; Fri,  3 Jul 2026 14:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783089650; cv=none; b=UDor8MBaUshiGMCQGQzgCFzXv8jwvGacbCFg0q/xatkbksgVNDaaxbjfIeeIoXvevy/yovWr8CeW6fb/SxiEhutZjk0UPo3XIbEQ/JHVSfpmTznbVIfrk2u2nFwVZRnZjNaXutBWUzBwHkct9y3ERXedID+pfi4z0web1SFZzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783089650; c=relaxed/simple;
	bh=U8TDv0Jy1YTKTLmkSymvNzGr2mU/AvxfhRbbarGikvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FOUbOxiyjeNCcoktFSCqefnYmL9YWlIjkrZGgkRlFnYBHt2IQTK6toZKoscFt9EMOC0KjfjQdHGYNeQh6g1phTt32wBsLK8uUdnSIosCAGpasljCbCvEL6CJrWm/5caOmzbQqgIEQZpcSlgLO8vxuqQQpwOCtZaQ7PzQiQEW6ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hFbigXIf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hFbigXIf"
Received: by smtp.kernel.org (Postfix)
	id 0CD7A1F00A3E; Fri,  3 Jul 2026 14:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F961F00A3D;
	Fri,  3 Jul 2026 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783089648;
	bh=yoyoztEkUCuwtDIJ1oD9VzDkerwNGbAQFP+wps51TRo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hFbigXIfXd6KA44WVhCvXBpb5mwO73t/qRpQmG61ZcrNxAeAPGAWssa3Q4ApVbcL/
	 vvqLQhnysY1Lc+YsLyNMn5jmjOGD8/UF0rUuOBV+XZN6w91J4/d/5+J0bBfkve0Blu
	 +W5XW/ztYo5jVweSLzPy3tYNYtshxfUpG426lG/W8ClkTEBxow9nuakRC7ifrzwj0v
	 CqIfOHeCopZEmm/9DF2ffLYSI7hquSyOHfuAp9L9GfdLTwMbMQJgFf+yFcvih0Ax2P
	 dolj4B96kcnxH0p03i35ZjCUv/zOZIPBx0rVJThmcLCS672pa/06hAuWkR0EuU7jCV
	 2zrekS0CBdm+A==
From: Thierry Reding <thierry.reding@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] soc/tegra: Fixes for v7.2
Date: Fri,  3 Jul 2026 16:40:36 +0200
Message-ID: <20260703144042.1190046-2-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703144042.1190046-1-thierry.reding@kernel.org>
References: <20260703144042.1190046-1-thierry.reding@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <thierry.reding@gmail.com>

Hi ARM SoC maintainers,

The following changes since commit 8b8ee2e56f951ccf41d98eebe73195cea487cd48:

  soc/tegra: Use ARM SMCCC to get chip ID, revision, and platform info (2026-05-29 14:42:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-7.2-soc-fixes

for you to fetch changes up to 265d5d4032c5f6eb089a6e6241d37fdbde7da180:

  soc/tegra: fuse: Fix spurious straps warning on SMCCC platforms (2026-06-22 09:25:36 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Fixes for v7.2

Fix a spurious WARN() that was checking for an outdated condition.

----------------------------------------------------------------
Breno Leitao (1):
      soc/tegra: fuse: Fix spurious straps warning on SMCCC platforms

 drivers/soc/tegra/fuse/tegra-apbmisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
