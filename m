Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B98A1C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BB9B22B39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 20:32:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BB9B22B39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4aFnQkNmOkxwsm+aJfZ/mY0A43Txu1b9VVHypaMb9LE=; b=ayl6DtnLUU3Ey6v6pY2pu7EuS
	jRmqXbx6N+RZ4TBYDy3rEKW2r5PGtqhYgym5Qd30Gm6ew3R0DU/L9ya4BucX5lJJMDS4/k7NfR1MR
	ScrsXj44+iPZTR+nAIpNkD9nRede7hBRlqinQl3rlJ/wG1wp4REJ8fJA+dGIj14UiO3A0PjaguuBJ
	euPXU3mrBmsrN2GPJVvGoEzLYvkciVy3fa9xmGatokShxX167oHAMcnaHYZZpg+RUodXHsN/FVRdG
	tnY+DMeQvCKw1mEUWbPIeREhA0j88dQOeUAixUNHnEyY4qsdiOBeA4cwYHACj5nb9stZMnVmsN8UR
	SnrCUucbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn67L-0004K5-2r; Wed, 09 Dec 2020 20:31:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn66t-000435-EU
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 20:30:52 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Michal Simek <monstr@monstr.eu>,
	SoC Team <soc@kernel.org>
Subject: Re: [GIT PULL] arm64: dts: ZynqMP DT changes for v5.11
Date: Wed,  9 Dec 2020 21:30:39 +0100
Message-ID: <160754580143.2405127.141157774584873312.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
References: <f460f6ac-d235-a33b-3d0f-ca904a43e687@monstr.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_153051_628616_54FE03EA 
X-CRM114-Status: UNSURE (   8.37  )
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
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209203039.auLjxIOlek0kENy7AQGHK_O7YfWyT4t7kU3eVqn0D5I@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 9 Dec 2020 15:56:47 +0100, Michal Simek wrote:
> please pull the following changes to your tree.
> 
> Thanks,
> Michal
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c87b013f23c6aa0e244abb8bcbc83ef383827180

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
