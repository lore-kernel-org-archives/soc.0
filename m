Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8397CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 08:24:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315CA64EC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 08:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 315CA64EC5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JAOB4vhk248WYV2btRltRSSU/bkX/G9M3XpJrAjOpvQ=; b=OKg4R0m8tzULw4+CWi6wqxObVU
	7rBNE89xDDWG1wFTSx4Y70Y86A3F57lhjBgv0HGjiaSS5YO/Z+2vQgRJApMzPiO+AvmQTeEEoRaMM
	m+j41DhU/X9IyOqXRJO92xGaHBPGvZ5r3dyK/lD1PXUa6dVSDN6C7Fvt4xrtqpkX3GvMJuefOQHpx
	3TNFklilQMI0iH9H0NiFmZvvGP2PwNfFf9V2pVg9MtQvIv3uUYTteFRO90A51zLaf5drnzItq3SGG
	6dTyYgjc1xzu6Ijj6/m5T+fSuVk0AuTkjfvX7f2WgNKwIhSNrciCGUoQW3WrpiBIACfbn0Fh30Aux
	zkB87P8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA7Fe-0001Dr-AM; Thu, 11 Feb 2021 08:23:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA7Fc-0001DO-EG
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 08:23:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9FD064E16;
 Thu, 11 Feb 2021 08:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613031779;
 bh=BYNKdB641tbIHjMtGzjmd4sQCNJ/fauTzb5OJP1vN48=;
 h=From:List-Id:To:Cc:Subject:Date:From;
 b=SEVKxx5Me68iMP7bz5EQVmUvQONUfFqPtgAtUyeBNpAZpaJPc+8ekeg24KdkcFhLI
 D/uPP+xH5vb4BS7jdzRvfKWodpL7HRV7p7YUINIGL4FP+u6nWe1QOXvylU7LnvO+DD
 5++CHj1rdncMGyqmGcYHMewPl2bm0pIzHHJaBPDcXAr27NvKgpVxJPwXqcPv0CHeXl
 WEJrecE2dbiKzipPz7PL8IbRuie/nLATEW6CYWmx67ZYiMaCEAOnNVN0RtG1ilhmC9
 S8cJ2ZQCzatKMf6FHkvYHYml6bwijKYZrTKUf1yDuFD6k0/sQ7/YkOYfBoQLvK0Jhj
 H3gR810nmoFZg==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Subject: [GIT PULL] ARM: mach/soc: samsung: late pull for v5.12
Date: Thu, 11 Feb 2021 09:22:54 +0100
Message-ID: <20210211082254.7934-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_032300_581991_FFA5C586 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211082254.1wmj6xkVrFL0U9ftr4xi--_1bR_SfokOD3cV0lu3eds@z>

Hi,

Late pull with minor mach/soc fixes for v5.12.

Best regards,
Krzysztof


The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.12

for you to fetch changes up to f503878564f5e68c1aeb1ea01e437060bf905c50:

  ARM: s3c: irq-s3c24xx: staticize local functions (2021-02-08 18:10:21 +0100)

----------------------------------------------------------------
Samsung mach/soc changes for v5.12

Three fixes for S3C24xx: one for building with clang and two for
warnings.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: s3c: fix fiq for clang IAS

Krzysztof Kozlowski (2):
      ARM: s3c: irq-s3c24xx: include headers for missing declarations
      ARM: s3c: irq-s3c24xx: staticize local functions

 arch/arm/mach-s3c/irq-s3c24xx-fiq.S | 9 +++------
 arch/arm/mach-s3c/irq-s3c24xx.c     | 8 +++++---
 2 files changed, 8 insertions(+), 9 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
