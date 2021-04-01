Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C13C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:12:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D922610C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D922610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A2zADuW/gAMgM8bHQztdSzW2n7xkNg+hgB7YG0YQ3C8=; b=hjGyUU+JKfgbLy8nKwmHulXbN
	dJptyY6csz2HLUw/CWd52SkC2fHXyKwrkdRzVrdY9CW9jPGNAAi4u45q4wi1rLAxBT4IZI7v4MFeP
	PxsDtG71nhtAndzTShr/j6+cBgdloBkaKsgY+L+GjPafvB/GJ/poC0p5efguiEy41MyzydWy2c02H
	mVf640Zyw2SjGrNlGEnhJ4ImN0kte9eyj53Ax99mkl9ebarIQliLvya8QlRuS+rMTvdFuA9L/bDTO
	83F+WLFfvBtDpVmlA9JRjLb9IAdHN8ZKpZuVpUYARCZXymShywZHao1L7lXZns81alD9A/ZXpuI5T
	03WUFwKmw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4XE-00B11L-Ca; Thu, 01 Apr 2021 21:07:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4W8-00B0wO-0M
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:06:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86420610F7;
 Thu,  1 Apr 2021 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311172;
 bh=H9C7fZndGJzPonnBNukM9PU9HffsDsUwZe9xsFCNTjY=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zde4Tq/KLW9oTtQpqqLvTJIW7Ovz6uQA7GJlK93z7irpHWSVhqdhlF4lZZMpuArux
 qLm3SA8D/VErmgtN+yJsfY9+w5UZExas1Jcjue5G1Y8rCqPHjZ3kPwWAT49W74CU6t
 WN6LzzKzy/HsOJXEeGd5HpRcIa0M+SwQ/63LHKl8AF99owKe00Hl6wXZ1iuo5354Ts
 NLiZ6OmYaeyma6bvkZukgAfpJyYCA3VcWRHuA8yuND9xlUNoodur1TJiTgH6uRwILY
 DVBpvNBtxfTpdyVtMUtC2lnuKRW2QdJHs38sAaI/MpbEyzWVPED+OEoU6KlcaEY1NP
 54Ad0fReIHUng==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Mark Brown <broonie@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
Date: Thu,  1 Apr 2021 23:06:02 +0200
Message-ID: <161731114633.662954.15683308110570757088.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401102858.4095-1-broonie@kernel.org>
References: <20210401102858.4095-1-broonie@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220642_770641_1FEF2F36 
X-CRM114-Status: GOOD (  10.09  )
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
Message-ID: <20210401210602.5uZCw2cvc6fHwtzZitbdekYhewXt0SoCNXT8NNMNP18@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 11:28:58 +0100, Mark Brown wrote:
> The userspace consumer is a development tool, not intended for producton
> systems and so should not be present in defconfigs especially not those
> for specific machines so is not a good fit for defconfig, remove it from
> those defconfigs where it is enabled. No system in mainline actually
> instantiates one.

Applied to arm/defconfig, thanks!

[1/1] ARM: configs: Remove REGULATOR_USERSPACE_CONSUMER
      commit: 797e1491b8df16eb666ec12f7a49515f12515c37

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
