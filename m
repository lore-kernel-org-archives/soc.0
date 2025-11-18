Received: from mail-m1973191.qiye.163.com (mail-m1973191.qiye.163.com [220.197.31.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B13732B997
	for <soc@lists.linux.dev>; Tue, 18 Nov 2025 12:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467677; cv=none; b=HjTIyYhzPF9gouiCXk+627b/7bg9Trsk4I50zv0G1lYm6Usoo/uAfNuYDyf5avlzCwFJUjp0cxoyF3pC4Kn63nBtHfHXyCoVQ/4vxE7pVx+dvwSpNz8VfjD2ZTWIkkhz6DRFVLPQOy4gF2KP7Y/Sw/HqCu7DK3jIBf5Va8+F1PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467677; c=relaxed/simple;
	bh=BrZuvvYA0b9KF8OlJAzSmpDRZqvwzMPeeVcZqKTNrlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqNbC8Sjpaq/RtCgl4wTq4ulalAZRYzJias1cpJ4KvB6clgNIILIh+NA5PpR6O1scZgysa/6LwUTZKTamuAT4XdTwGeg5Whn9sjiG0MXrjGYOZwsjH2Q2Rl1YP7sbz1sLGjRXAFmMAj/Sw75MnsIS8E+oMLyVW4hs4atcpc6SW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=h4TgurKp; arc=none smtp.client-ip=220.197.31.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="h4TgurKp"
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29ffcdd1d;
	Tue, 18 Nov 2025 20:07:45 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: yangzh0906@thundersoft.com,
	catalin.marinas@arm.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	soc@lists.linux.dev,
	ulf.hansson@linaro.org,
	will@kernel.org
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Tue, 18 Nov 2025 20:07:45 +0800
Message-ID: <20251118120745.2480682-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251031045253.789621-1-yangzh0906@thundersoft.com>
References: <20251031045253.789621-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a96dd212909cckunm5c4ae9aec236f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHxpPVhgaTk9CHUNDGk4ZT1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=h4TgurKpjh0+KCb9/AYKYVSLvcM6f0LbHBzBTmLGhX90ZoCGqOO1OmT197YUkCyCnNEE9b0AKgdhWkZjBDzgrqNnCtzvuHCozeE34wzR7I0U2SYixGWhmT9etr683/pLSPZN5f5XP6z+BqWurh2A6bAR16bjpI7IOm6Tkaq/Vas=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=R0UK7D7hfRYPA6PYQUa2Dx0DF8D82pW5mt2sd7BW4nU=;
	h=date:mime-version:subject:message-id:from;

Hi Arnd,

Gentle ping on this series. I sent a follow-up two weeks ago [1] but 
haven't heard back yet.

The v5 series has the necessary dt-bindings reviews (Rob's Acked-by 
and Krzysztof's Reviewed-by). Based on your earlier feedback [2], I 
understand this should be queued for 6.19 after 6.18-rc1 is released.

Is there anything blocking this series, or any changes needed? I'm 
happy to address any concerns or rebase/resend if that would be helpful.

If you're busy with other priorities, please let me know if there's a 
better time to follow up or if I should take a different approach.

Original series: https://lore.kernel.org/lkml/20251016120558.2390960-1-yangzh0906@thundersoft.com/

[1] https://lore.kernel.org/lkml/20251031045253.789621-1-yangzh0906@thundersoft.com/
[2] https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/

Thanks for your time,
Albert
