Received: from mail-m3293.qiye.163.com (mail-m3293.qiye.163.com [220.197.32.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1E2D5920
	for <soc@lists.linux.dev>; Fri, 31 Oct 2025 05:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761887298; cv=none; b=qCwgjIiGpiV2K9o/tN124DO2Rd3KBBlqDQ4JsZrRva1duU7q+1VsfMmdKKYN/8Rpbl9sipeI7XOnnv6oxmU0QRxTkHCAZtR0wUabifxuLUpD9GMTmxYLeKtnekxuFA36SyUZqhWTE2wufYAeYwEh98zgXqg07bhsdf3ha/S41t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761887298; c=relaxed/simple;
	bh=rZYojajc/GZnnqfLJ0TerXgFrRFfpRChE26/+4ZhIU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bm2lgKQ3kg9zuHFIxZ2bHNubHDEhals609+TuH+rJZuIDssHuLxsjFIm6YmiDIV8MzSto/h56Vues0v/JbIPZHkHf6yH8nSO0slu4Pg9MstbpjDK37CcKcAlUBrlVTm6gdwKgmz5xMwukaOvo3BCJVqUJ3g1NzcBFdH+Rqf9Gh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=f2wz2SzZ; arc=none smtp.client-ip=220.197.32.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="f2wz2SzZ"
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 27df65d1c;
	Fri, 31 Oct 2025 12:52:53 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: arnd@arndb.de
Cc: soc@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	krzk@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	ulf.hansson@linaro.org,
	conor+dt@kernel.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v5 0/6] arm64: introduce Black Sesame Technologies C1200 SoC and CDCU1.0 board
Date: Fri, 31 Oct 2025 12:52:53 +0800
Message-ID: <20251031045253.789621-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
References: <20251016120558.2390960-1-yangzh0906@thundersoft.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a389c874609cckunm02ed9fdf61527c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSU9CVklDHR4eS0lJTElNQ1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=f2wz2SzZAlsfxhX8+oVUJd3MqUei8pXHJ3+WZFzhM6YiBUlGgF3ubrCPUCRGn1W3cx0ZlLk1bjiCa/hbXjQH7H/2AzH8Ocmnusys3lhyStBM0vC9XSZgAt/P/rfzRKobJvB8M/UidwAlh4qnhAf9Y68BZotzrG5O40/WuUvAN5U=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=rZYojajc/GZnnqfLJ0TerXgFrRFfpRChE26/+4ZhIU8=;
	h=date:mime-version:subject:message-id:from;

Hi Arnd,

Following up on the v5 series for BST C1200 SoC support. The dt-bindings
patches have received the necessary reviews (Rob's Acked-by for 1/6 and
Krzysztof's Reviewed-by for 2/6).

I now understand that the SoC-specific patches (Kconfig, DTS, defconfig,
MAINTAINERS) should be reviewed by the ARM SoC maintainers rather than
the DT bindings reviewers. Please correct me if I'm misunderstanding the
process.

In your previous feedback [1], you mentioned you'd be happy to merge the
SoC portions in arch/arm64 and suggested resubmitting for 6.19 once
6.18-rc1 is out. Could you advise on the next steps? Is there anything
I should prepare or address before the 6.19 merge window?

If I've misunderstood anything about the process, please let me know.

Series: https://lore.kernel.org/lkml/20251016120558.2390960-1-yangzh0906@thundersoft.com/

[1] https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/

Thanks,
Albert

