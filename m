Return-Path: <SRS0=A3ES=RY=marcan.st=marcan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A73C433FE
	for <soc@archiver.kernel.org>; Sat,  8 Jan 2022 05:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C5C3C36AED; Sat,  8 Jan 2022 05:13:57 +0000 (UTC)
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69978C36AE0
	for <soc@kernel.org>; Sat,  8 Jan 2022 05:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69978C36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=marcan.st
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=marcan.st
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id CFED641982;
	Sat,  8 Jan 2022 05:13:51 +0000 (UTC)
From: Hector Martin <marcan@marcan.st>
Subject: [GIT PULL] Apple SoC MAINTAINERS updates for 5.17
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st>
Date: Sat, 8 Jan 2022 14:13:49 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 7bit

Hi SoC folks,

Please merge this trivial MAINTAINERS change for 5.17.

This commit was waiting on the watchdog driver to be merged, but I only
just now realized that it silently did. Sorry for the last-minute pull.
If this can't make it into the 5.17 merge window, it can be added as a
fix later instead.

The branch is based on asahi-soc-dt-5.17-v2 to avoid a merge conflict
with other changes that happened there.

-Hector

The following changes since commit 301f651614c3396d711a8cc3f92f6fb95b12f5c5:

  dt-bindings: mailbox: apple,mailbox: Add power-domains property
(2021-12-15 20:20:38 +0900)

are available in the Git repository at:

  https://github.com/AsahiLinux/linux.git tags/asahi-soc-maintainers-5.17

for you to fetch changes up to 6dc701ee9fabfc929cae2d7acc957bf38e4c3264:

  MAINTAINERS: Add Apple watchdog to ARM/APPLE MACHINE SUPPORT
(2022-01-08 14:10:03 +0900)

----------------------------------------------------------------
Apple SoC MAINTAINERS updates for 5.17.

Adds the watchdog driver MAINTAINERS changes. The driver itself is
already merged.

This branch is based on asahi-soc-dt-5.17-v2 to avoid a merge conflict.

----------------------------------------------------------------
Sven Peter (1):
      MAINTAINERS: Add Apple watchdog to ARM/APPLE MACHINE SUPPORT

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

