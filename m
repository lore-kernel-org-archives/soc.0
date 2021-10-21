Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF8BAC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 09:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68D126112D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 09:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 68D126112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jp4w8X3EicFp6fpzfRUc1RrKFCqW92EA8tHmGRq27xg=; b=WWAXEMKTrCpo1t
	3bLn2USP7JFJSrQmSaniMiKvfJAiLii5FPmGD/9UWdal0qdcd3Lsc+eXHRobKtOAEysvTJci1noWe
	KVUysVnwNiQOVix6hCH7v3IwJ0SFTzdlBRpNwsp8j0LOk3a8agm8CO48c3nWK0sHvu0+/bF6vqQM4
	1ERfv0rlSZhrED+S3BW3XX541OLbrKs999wTxaYjBKgt+QtD6AsgAQ9aetwe2SXI1uiFx9Yj0FaeV
	Cv7zLnmn6egUl5WRKz/+2oInHVDEe8tMlq7cAt9xFY3p3MInp/ZiU7sSPpEJ0ic/YgRCbK+sbxinn
	EoLgFLTYsUtxNTB7UbNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdU5a-006ycn-PV; Thu, 21 Oct 2021 09:10:18 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdU5W-006yb0-I6
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Oct 2021 09:10:16 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 545B83FFFA
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634807411;
 bh=bbSHRxsR73bGstaaNlqrnr2h4OekYl5/Y0NpOv9VPBw=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=GiU2ougumgmG6uUTccWbtxnuXlWgVr3da9PbCxCKBeDFG/r5nSGbd27f0fPQdp9Qk
 zMpP8NuMd69UlfOcHqnQ2wZnV82hAZNalisRtj1eqeBRcX4D4uLIc8jwyzQhSEq/7W
 oGoFINOMP3IKltFK04IK5U0dcuj+H8ta0hzy9ogjd5tnnHW7XNE8unhF6OeG4FHvNs
 Dx1Cix6eB/TKFN6ovimHQqgNz7IoAiscFS9xU7rCyaP33b2fAFQAoAlMN2JYftnziW
 kewhpBsjMhgQMIoumEls940J/I+TjLUzrGlioCZzxKr1NZw6MyS8/pZ6wTMgHxI5fP
 lDYkka2ciCSOA==
Received: by mail-lj1-f199.google.com with SMTP id
 a20-20020a2eb554000000b0020de66f70bcso550296ljn.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Oct 2021 02:10:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bbSHRxsR73bGstaaNlqrnr2h4OekYl5/Y0NpOv9VPBw=;
 b=4YaoJc8lqsK52JiPiD6DioqaF9ywb6h6WNy9sgJtvU0l1Xq0jUVSQTmioFyi5VHbH1
 JWcGrZpglb4Nc58hpm+vW6EJwcKECSYSYRmobmzBr4t54uprob0MzfPwly488NlzZ8ki
 e7Vh2NjnsWRp09cWMVGUFDeljr7pDgFTXpTEF2mGLBzaJUzqooWCqUSYwRxgGAK4ikBF
 +TH4hIEKu87+hOfI8XxDDqJ3sv53LyUUaqGUf2L/u+bvt5YIgg+O3uY/cbJg/XECuCMO
 CUUokUfQQtzjt4VtlupAr06/zETNx/Svw6tmlX0FUYJv75ZZ+tYtG3c+m6uerc6TIHAM
 A8iw==
X-Gm-Message-State: AOAM532AWWmJnn8HNf7X0h+zyHQm8t+KdUxdtLLvIkjhVjjRZVZ/Akhs
 EcFDqExn04MJH5QeEuLnNR/VnLtiibO9RzZMH0wf96Na/905jKjhf299DQQtV2TqAhuwR99DsnK
 qKOsrUYs3sdlth5W67QZC/lcrEccCBqv5KKTPhQucvLN8/l/P2lgB
X-Received: by 2002:a2e:a171:: with SMTP id u17mr4669567ljl.371.1634807410715; 
 Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJi51V3uLcQ6VQf22lZE+UEugXH6TyHQQH8xsi40Ilosw8EeaKsw6tjG5kUM2pWTCLIevk/g==
X-Received: by 2002:a2e:a171:: with SMTP id u17mr4669547ljl.371.1634807410497; 
 Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 v7sm523707lji.81.2021.10.21.02.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 02:10:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [GIT PULL] riscv: dts: few cleanups for v5.16
Date: Thu, 21 Oct 2021 11:09:55 +0200
Message-ID: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_021014_892040_F25BAD57 
X-CRM114-Status: GOOD (  13.32  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211021090955.N10NNQhCDkOP5ZvKbi4Q8jC8zNV44ay-t4zG3kVKJXU@z>

Hi Arnd and Olof,

I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
August 2021 (v1, v2), resent in September and pinged two times.  They got some
review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
unfortunately Palmer (RISC-V maintainer) did not respond here.

The usual RISC-V patches go via Palmer to Linus and I am not planning to change
that, but I want to get these fixed.

Could you grab these to soc tree?

Best regards,
Krzysztof



The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/riscv-sifive-dt-5.16

for you to fetch changes up to 9962a066f3c1d4588d0dd876ceac2c03ef87acf3:

  riscv: dts: sifive: add missing compatible for plic (2021-10-19 10:59:57 +0200)

----------------------------------------------------------------
RISC-V DTS changes for v5.16

Cleanups of RISC-V SiFive and Microchip DTSes with dtschema.  These are
few minor fixes to make DTSes pass the dtschema, without actual
functional effect.

----------------------------------------------------------------
Krzysztof Kozlowski (5):
      riscv: dts: sifive: use only generic JEDEC SPI NOR flash compatible
      riscv: dts: sifive: fix Unleashed board compatible
      riscv: dts: sifive: drop duplicated nodes and properties in sifive
      riscv: dts: microchip: add missing compatibles for clint and plic
      riscv: dts: sifive: add missing compatible for plic

 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi   |  4 ++--
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi          |  2 +-
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 10 +++-------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  7 +------
 4 files changed, 7 insertions(+), 16 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
