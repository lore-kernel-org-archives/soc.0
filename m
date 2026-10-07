Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7EF370AE7
	for <soc@lists.linux.dev>; Wed,  7 Oct 2026 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791385243; cv=none; b=ZtDMJ+0C94NC63AjGZcges0gbpChVTgvACEgPFnNAP810v97VGwnXny+18zS4+77ESPms49led1lBxVaJF0aEzNjby5wLe5b5sai78np2dhXz9HffvwJJQ9dCLT7p0CP8zxoVxyw1JznLw2OhfT/qGCg+jo4Ml1tSsYLL1zr+l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791385243; c=relaxed/simple;
	bh=asC6zfUUSU5aOS6AfgXlNaMp4mt/9FJYdyABnGVmH5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mwxEy1pe0qdvXugthXvnQBl+fXeeLUUlXrRtjPvjAjmn9NSDL2GWNz4Kwi1qI6nRN/kCWiwZD1jNnnF7JGwHsav4x9BP21a0h14woPUIDUGw1TNy/WATR7qToaAUyVkchHG1s7/UwuL3fk3DaexrWBGAw7zvutS7ACBxb+PNhi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtVVktrK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtVVktrK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CAE1F00893;
	Wed,  7 Oct 2026 15:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791385239;
	bh=oLYNuqjkWzyrA3tX1SXacbJGzDcV3DButmvf7uXrweo=;
	h=From:To:Cc:Subject:Date;
	b=CtVVktrKOX8rhw0sWmiumIwtGZcx30H0KJ+/9MxnxvM+Irf9xQBFjcEH0jr9am8zB
	 /1LAR+oT8ZdV+2Q1tB9RydvDCsF1nJSrXOsnLXn8wFRBdCXrvsDjb4yDlihbgQD4vz
	 vFSMA5UlcM/n454sx3yj9ZwQyPjBYaz29oV51OTgGgnXuaSHv8SWG6udgt+9anJP5i
	 mTI25Ge9FMiTJyFytzlaTiOOyFRCQZPS26PmOYb0Hf+iW3vFBMDqVx5XS+4LF7hZPM
	 19cWNHqJKRKKytR2T9nmTBb/YnI7LVddrCZurjfX2v3XNrmImwn+rS/CvKmeimPLGd
	 HYWBT+917yuXw==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: SoC Team <soc@lists.linux.dev>,
	ALKML <linux-arm-kernel@lists.infradead.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Subject: [GIT PULL] ARM: vexpress: Fixes for v7.4
Date: Wed,  7 Oct 2026 16:00:31 +0100
Message-ID: <20261007150034.624664-1-sudeep.holla@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC Team,

Please pull ! These came in recently and are in -next for a week now.
I am sending these early for v7.4 as fixes instead of waiting until -rc1.

Regards,
Sudeep

-->8
The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git tags/vexpress-fixes-7.4

for you to fetch changes up to 27b98d331f1dcebe088ab51a7061a387a7440cb2:

  ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus() (2026-10-01 09:37:40 +0100)

----------------------------------------------------------------
ARM: vexpress: Fixes for v7.4

Couple of device tree node references acquired during VExpress SMP
preparation were never released. Add `__free(device_node)` to the node
pointers in `vexpress_flags_set()` and `vexpress_smp_dt_prepare_cpus()`
so their references are dropped when each function returns.

Both leaks occur once during boot and have no known functional impact.

----------------------------------------------------------------
Weigang He (2):
      ARM: vexpress: fix device_node refcount leak in vexpress_flags_set()
      ARM: vexpress: fix device_node refcount leak in vexpress_smp_dt_prepare_cpus()

 arch/arm/mach-versatile/platsmp-vexpress.c | 4 ++--
 arch/arm/mach-versatile/v2m.c              | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
