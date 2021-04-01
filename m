Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A7A6C43460
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F03610CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F03610CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KjEoq9713ZZaptwpOohLRUPRN8BgwxgrCDg+WTXNroQ=; b=egY5SEjfEFRV+kLFUBZfuD0Nf
	ViIMn8jHf8Hi2IkPWLzRhP1+x6guSypcHd1iE/2Up5k78RiPV9IMkmKt9KPt5OjdMISruyU/Wf4nX
	fmkb1TcmnggZ4WgaGt4RcC8w2n45Wf0Rr/xkSSSKQhUlCDOAPWrYMKXdZC4boeKOExMVSb9qW43uW
	DvNiWEMLSYoRv6M+L3+pT87AvCpcHDSPyDkY0tUVomXpoZnIZigHVCFwB2RhssFWcL20xvWrOtp1b
	nHvYkuTOLKb9lKD7NlhXLUwonEMWWbX1PT6YKZATayvDzBwWGmiFvvctSSDgbhvz3hVeMXEhS9NJ0
	+nko4nmCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuUb-009Cks-5N; Thu, 01 Apr 2021 10:24:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUM-009Cgg-LM
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:23:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F209E610D0;
 Thu,  1 Apr 2021 10:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272625;
 bh=p5KCKLqJHRYLueoAbYLS6e42Kesdgd2AMAGNW2j/wI0=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=bD0IXEYDeGDpArQsqq183H/4vvMYvpGwBHC45WambAigTgwEutUJwoOG7QSwqUTV8
 QMouKfXBF70IRWEj65ARgjBhhCZtd6CJ7MHNFM0aUDPDj5duIhJm9B9P6JE+zhUmkk
 l4hNZbWw37V+JIKxy62UHfgk2vVmY5nRhk/JEu2/lSa/HHgTQYBXbVsyAMfbhrroCt
 XpjcVwt+XUVckl1/eebUJ8AAmOhqfPsQVaX0ep9YA5DHIfPn8ZtZdkxCW32nvsRaBo
 1LMfg1SPtuaLmxqnX94pwnRQ3KUuZs16Lf4bQS4GfmrqU6a6oxsstlCcsqouj5i8Jn
 3zAemsOEnM2pQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Tony Lindgren <tony@atomide.com>,
 Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, soc@kernel.org,
 clang-built-linux@googlegroups.com, Nathan Chancellor <nathan@kernel.org>,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: omap1: fix building with clang IAS
Date: Thu,  1 Apr 2021 12:23:28 +0200
Message-ID: <161727243810.583633.14191051174001891363.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308153430.2530616-1-arnd@kernel.org>
References: <20210308153430.2530616-1-arnd@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112347_067273_07CDA70D 
X-CRM114-Status: UNSURE (   7.05  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210401102328.0fSCiMZr3FVuw1b2SAjEduXwTEu-zwlgkT2mG5pMlR8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 8 Mar 2021 16:34:21 +0100, Arnd Bergmann wrote:
> The clang integrated assembler fails to build one file with
> a complex asm instruction:
> 
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> 
> [...]

Applied to arm/fixes.

[1/1] ARM: omap1: fix building with clang IAS
      commit: b897653a2fd4b7d0a77aa209d1e6b5cc08899bbf

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
