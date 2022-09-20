Return-Path: <sashal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476EFC54EE9
	for <soc@archiver.kernel.org>; Tue, 20 Sep 2022 21:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11DF3C43142; Tue, 20 Sep 2022 21:47:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7972C4347C;
	Tue, 20 Sep 2022 21:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663710443;
	bh=QgtVkm2HQWg/t9RtLsyE7NWqYJP4qBcd5XTD1CygPg8=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=gpuIlK6uDZ6ogIOicRXkSMMTeHSPrPpZhLrau7GUo+5zW80ELnF9mvpjK97zhllge
	 i4NzkApymTYn1Ntn+YPbBQ0l2IU5pkhckPw1eeD+vHxmQRbVRgIVKG2K3kqsDHByX6
	 ZU7Ic1Ugjc5Z/PZqZjB+mxhfM5ZGO1OtJBGkOLh4L7F85HJnhidoViM4G+7Q+/cvSg
	 JGW0IcEY/0hlp23//zoKlOFyFwY1UOOARMn4IB/ISEJCvHqqXQb6rUd27h5omq9WIu
	 YzI8AXkESFy8CRI6OKNWwiZrjzAr9SdxC71OKU6NwQwC9TiRFJOW7zPnCBmAw1nKcU
	 IKNF1Vh4QqJZg==
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	windhl@126.com
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: Patch "arm: mach-spear: Add missing of_node_put() in time.c" has been added to the 4.9-stable tree
Date: Tue, 20 Sep 2022 17:47:21 -0400
Message-Id: <20220920214722.208469-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

This is a note to let you know that I've just added the patch titled

    arm: mach-spear: Add missing of_node_put() in time.c

to the 4.9-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm-mach-spear-add-missing-of_node_put-in-time.c.patch
and it can be found in the queue-4.9 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit 36321bb4ae4d9831fed71238b076d1eb4a8bba8e
Author: Liang He <windhl@126.com>
Date:   Thu Jun 16 17:30:27 2022 +0800

    arm: mach-spear: Add missing of_node_put() in time.c
    
    [ Upstream commit 2c629dd2d14fd7f64a553f809eda6d0b3a4f615a ]
    
    In spear_setup_of_timer(), of_find_matching_node() will return a
    node pointer with refcount incrementd. We should use of_node_put()
    in each fail path or when it is not used anymore.
    
    Signed-off-by: Liang He <windhl@126.com>
    Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
    Link: https://lore.kernel.org/r/20220616093027.3984903-1-windhl@126.com'
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/arch/arm/mach-spear/time.c b/arch/arm/mach-spear/time.c
index aaaa6781b9fe..57b77c7effa9 100644
--- a/arch/arm/mach-spear/time.c
+++ b/arch/arm/mach-spear/time.c
@@ -223,13 +223,13 @@ void __init spear_setup_of_timer(void)
 	irq = irq_of_parse_and_map(np, 0);
 	if (!irq) {
 		pr_err("%s: No irq passed for timer via DT\n", __func__);
-		return;
+		goto err_put_np;
 	}
 
 	gpt_base = of_iomap(np, 0);
 	if (!gpt_base) {
 		pr_err("%s: of iomap failed\n", __func__);
-		return;
+		goto err_put_np;
 	}
 
 	gpt_clk = clk_get_sys("gpt0", NULL);
@@ -244,6 +244,8 @@ void __init spear_setup_of_timer(void)
 		goto err_prepare_enable_clk;
 	}
 
+	of_node_put(np);
+
 	spear_clockevent_init(irq);
 	spear_clocksource_init();
 
@@ -253,4 +255,6 @@ void __init spear_setup_of_timer(void)
 	clk_put(gpt_clk);
 err_iomap:
 	iounmap(gpt_base);
+err_put_np:
+	of_node_put(np);
 }
