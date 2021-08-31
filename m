Return-Path: <SRS0=ZvFH=NW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A560C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Aug 2021 15:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0555E6054E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Aug 2021 15:23:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0555E6054E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=foundries.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p6r0J/7cVB8b1LeZ79E7BZRSK55YgiUztTDwtIbyQl0=; b=3OjJzSwU8PDrja
	sD1dN6nFkVsXJcoMMso4HPCMF2Ibp/HPROlWJYcLlSuMx6nN+mfJs/awVsju0cl0etbgbVZPdVrP6
	P1+q5lQLuawKhronyGJJ06ve1zNH0bPGfxBoYByYy6sQS3zqm887k5e6rzHtQlHt8D4PCQT8cfaVd
	N02qxD0JllVHArVmiz+JoidWnbIwKZptPfn24FHZGJVIvEuHmrlCI2EJwQpIoH6ORjP9nsZceOE68
	fbKgpohulNYmmaO6lhpD5F86x/wO2WoRuKt341ytHN3R2USTVXiphxs2uTv6NYKDw3y0l6kjpLjff
	BT+XviGTd9osQOZgfbZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mL5aE-002dAq-C8; Tue, 31 Aug 2021 15:21:54 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mL5a8-002dAE-Ld
 for linux-arm-kernel@lists.infradead.org; Tue, 31 Aug 2021 15:21:52 +0000
Received: by mail-wr1-x435.google.com with SMTP id u9so28302702wrg.8
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 31 Aug 2021 08:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foundries.io; s=google;
 h=from:date:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=PdWzVy+KCoOf7GLLv9OU4SNDxgUfYq96U+qVTICtiis=;
 b=WLscQd4jv2T8IKORw/Q19+nCUf+1IeY0MMDPzeNldNC4lvj+bVjXog7NqdBnVceHW3
 QAdxCJby391pRCJgXVvvoPRzJ8xt1195Cqylf5Z6+mfHnRuqrRczpEr11zv/HqmQqxHZ
 L47g3ZhPA0E/qbOaR+3rVCWIyVOm0R5TIsA8vc97NuDxQMIkyCET9CkAfqMFZaIJFg4t
 681nqNs3uXsYiKguPtzmq/kqnfZl50mVbgmp/EY1hflI1zY5jPEDmADnpmc3LVoU/eZJ
 flL/OoQBc7+4CJvIO/CFFCihWY5HKYejtbu5063YLxXun0bMhxSdNGRgPD05c4Er6J/a
 Hurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=PdWzVy+KCoOf7GLLv9OU4SNDxgUfYq96U+qVTICtiis=;
 b=if/1RUfB3FbPfZWfRMASLFj0mLHfUD9F4TcXQg9pVEMA1wDPjykcydNHZ0Ss4/EwRD
 2LrxVR+AnqWfNZe4tR3m45vZYh9IWVry5aQUU2G1/IuoI/6IZ0ILAlgkvTut4uVEwsXL
 VpUoEPxkbv/Jo9dxGZGTfdNrL6mO9EpnwXHBAc9maFIje37o02sFFQVwvXQ5TJnduKOw
 someb2zjAHyHZzVRmIcmvlBG/Lv5t7ZK73cZ+oPNEBIsUM4YLjy2ZkT7cmvaIZ19hz6h
 oVefvYH91Qun1Y6Ad+ZcSl9er2y2WcI8ihiFLnjr8jp2tf69gSTokqsz/I9Df46VftYy
 4PKw==
X-Gm-Message-State: AOAM530yyc2gVtqfGA7e5a9yVMVcV4pJbGWT2kLm500wQ1ro9njgW7Bz
 s7rHxpZjgbyPbH6CG2I5ZSoALQ==
X-Google-Smtp-Source: ABdhPJzCgW0b2yP2tbW046Yx26EYiNa5/xe/k5Pl/qfv9dFJIcFZg8y6wcEXodMiOlGWKxi+3c7zlw==
X-Received: by 2002:a05:6000:34a:: with SMTP id
 e10mr13836206wre.421.1630423306313; 
 Tue, 31 Aug 2021 08:21:46 -0700 (PDT)
Received: from trex (162.red-79-154-201.dynamicip.rima-tde.net.
 [79.154.201.162])
 by smtp.gmail.com with ESMTPSA id u27sm19342861wru.2.2021.08.31.08.21.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 31 Aug 2021 08:21:45 -0700 (PDT)
From: "Jorge Ramirez-Ortiz, Foundries" <jorge@foundries.io>
X-Google-Original-From: "Jorge Ramirez-Ortiz, Foundries" <JorgeRamirez-Ortiz>
Date: Tue, 31 Aug 2021 17:21:44 +0200
To: paulmck@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: josh@joshtriplett.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, jiangshanlai@gmail.com,
 joel@joelfernandes.org, rcu@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: rcu_preempt detected stalls
Message-ID: <20210831152144.GA28128@trex>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_082148_768812_580F18CC 
X-CRM114-Status: UNSURE (   9.80  )
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
Message-ID: <20210831152144.VOyu0gjmwOCWZBtSzDaOYQE-YYszY9tK_z8p-fZZ_kM@z>

Hi

When enabling CONFIG_PREEMPT and running the stress-ng scheduler class
tests on arm64 (xilinx zynqmp and imx imx8mm SoCs) we are observing the following.

[   62.578917] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:                                                              
[   62.585015]  (detected by 0, t=5253 jiffies, g=3017, q=2972)                                                                   
[   62.590663] rcu: All QSes seen, last rcu_preempt kthread activity 5254 (4294907943-4294902689), jiffies_till_next_fqs=1, root  
+->qsmask 0x0                                                                                                                     
[   62.603086] rcu: rcu_preempt kthread starved for 5258 jiffies! g3017 f0x2 RCU_GP_WAIT_FQS(5) ->state=0x0 ->cpu=1               
[   62.613246] rcu:     Unless rcu_preempt kthread gets sufficient CPU time, OOM is now expected behavior.                        
[   62.622359] rcu: RCU grace-period kthread stack dump:                                                                          
[   62.627395] task:rcu_preempt     state:R  running task     stack:    0 pid:   14 ppid:     2 flags:0x00000028                  
[   62.637308] Call trace:                                                                                                        
[   62.639748]  __switch_to+0x11c/0x190                                                                                           
[   62.643319]  __schedule+0x3b8/0x8d8                                                                                            
[   62.646796]  schedule+0x4c/0x108                                                                                               
[   62.650018]  schedule_timeout+0x1ac/0x358                                                                                      
[   62.654021]  rcu_gp_kthread+0x6a8/0x12b8                                                                                       
[   62.657933]  kthread+0x14c/0x158                                                                                               
[   62.661153]  ret_from_fork+0x10/0x18                                                                                           
[   62.682919] BUG: scheduling while atomic: stress-ng-hrtim/831/0x00000002                                                       
[   62.689604] Preemption disabled at:                                                                                            
[   62.689614] [<ffffffc010059418>] irq_enter_rcu+0x30/0x58                                                                       
[   62.698393] CPU: 0 PID: 831 Comm: stress-ng-hrtim Not tainted 5.10.42+ #5                                         
[   62.706296] Hardware name: Zynqmp new (DT)                                                                                        
[   62.710115] Call trace:                                                                                                        
[   62.712548]  dump_backtrace+0x0/0x240                                                                                          
[   62.716202]  show_stack+0x2c/0x38                                                                                              
[   62.719510]  dump_stack+0xcc/0x104                                                                                             
[   62.722904]  __schedule_bug+0x78/0xc8                                                                                          
[   62.726556]  __schedule+0x70c/0x8d8                                                                                            
[   62.730037]  schedule+0x4c/0x108                                                                                               
[   62.733259]  do_notify_resume+0x224/0x5d8                                                                                      
[   62.737259]  work_pending+0xc/0x2a4

The error results in OOM eventually.

RCU priority boosting does work around this issue but it seems to me
a workaround more than a fix (otherwise boosting would be enabled
by CONFIG_PREEMPT for arm64 I guess?).

The question is: is this an arm64 bug that should be investigated? or
is this some known corner case of running stress-ng that is already
understood?

thanks
Jorge




_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
