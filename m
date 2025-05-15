Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A0425A2B2
	for <soc@lists.linux.dev>; Thu, 15 May 2025 06:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747290697; cv=none; b=t9VPZAzV0vMSS+jYAYwfSs7rRsa7I+hvkYgTozqA70McXIaFcd4srRhTBd2KUjXY1SxaUXzX2+J5eQBoZNZS82ZQtqcMD7n9Du8xA/t6gkieOuUw9h271cOwEd0txgLpwtuAxb14o2kmZCjJXj0W6tWYRevggjHKeyLaaWGkeXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747290697; c=relaxed/simple;
	bh=7ETWbCUzFzBp6DT3lh6i3k249qrgOWsVnFZogRbFKlg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZMYsHER13/MggjIpRnyRGBzDp5IggRrR2n+ksjkn84kHKUxsgqh0LMVOldfPujDWPRqHNNCna6N43Gb9Fz9lwyTfNxOF2vABMeINHT8SswNRkWBA6kcx2Dd2zs3/pzPA8VhwYHgBPT9SwI5MpGiSaqX9vkWOe7B+s7QU6aVpI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=j8vYHez/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="j8vYHez/"
Received: by smtp.kernel.org (Postfix)
	id A43FFC4CEEF; Thu, 15 May 2025 06:31:37 +0000 (UTC)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7803FC4CEE7
	for <soc@kernel.org>; Thu, 15 May 2025 06:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7803FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1747290686;
	bh=tcTGEOW21ZANz7DF0nN9kiC5h5jnkk2SrdMkliPxu2g=;
	h=From:Subject:Date:To:Cc;
	b=j8vYHez/zlJJjbbLXJujAuD1EVcO+RxS+GsV5GNI6xiSEsDv3VGyUeKid/792chEP
	 daW9LrpP8EgBAnuph95v0WEqZf3vrY6YMFYABblDTLxK7vGTutAkx5PKPDK4LWrNNe
	 mrAZcrxhNNAzWH8IAHg3qV1Ynx4la8Rt0l0/tWBjHfizY97Dn8KSX00VjXGRjzuHxH
	 p0/NYYEm8ttV5UdpoqwB4AarsthOWj9c9zj+Zk8XLzv4GHWFfHuFGpwyYZhnnFRFxJ
	 zyHvdap8WdscmutUsYS6970rqapKzpdC3afgDHfBdELm9i4RZW2qF/I/1fipCviE32
	 67avFHsygekXw==
Received: from [127.0.1.1] (unknown [180.150.112.225])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9EF597B9DE;
	Thu, 15 May 2025 14:31:25 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: [PATCH 0/3] soc: aspeed: Minor fixes for v6.16
Date: Thu, 15 May 2025 16:00:41 +0930
Message-Id: <20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABGKJWgC/x3MMQqAMAxA0atIZgO2tkW9ijiIiZpFJQERpHe3O
 L7h/xeMVdhgqF5QvsXkPApcXcGyz8fGKFQMvvGxiS7ibBczIancrIYJXcJAfe/JtyFQB6W8lFd
 5/us45fwBMx8UIWUAAAA=
X-Change-ID: 20250515-aspeed-drivers-6-16-4d992d2344d8
To: soc@kernel.org
Cc: joel@jms.id.au
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=917;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=7ETWbCUzFzBp6DT3lh6i3k249qrgOWsVnFZogRbFKlg=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshQ7dIRNrurFJbvq7Sy4qfH+ponZeWd20S37Ba/kr8sp
 kJr888bHaUsDGIcDLJiiiwrAm0L726eFP/zQPYxmDmsTCBDGLg4BWAiX9sYGWa7nU+fzianG3f1
 y/MPq3beW+rbfnqHc/Qc07Rd8z66M4szMtx0tHy+c0bv1klnnkaGt37Mc7MLKS7e2PRYryGPf7c
 AAyMA
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4

Hello SoC maintainers,

This is a small series of small ASPEED SoC driver fixes for v6.16 that I
didn't think warranted a PR, however let us know if you'd rather a PR
instead.

They've had exposure in next via Joel's for-next branch and have
otherwise been around for some time.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Henry Martin (1):
      soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()

Joel Stanley (1):
      ARM: aspeed: Don't select SRAM

Su Hui (1):
      soc: aspeed: lpc: Fix impossible judgment condition

 arch/arm/mach-aspeed/Kconfig          |  1 -
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 17 ++++++++++++++---
 2 files changed, 14 insertions(+), 4 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250515-aspeed-drivers-6-16-4d992d2344d8

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>

