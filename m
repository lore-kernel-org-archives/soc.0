Return-Path: <SRS0=PrJH=ER=loongson.cn=zhoubinbin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E023CA0FE1
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 06:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFDD8C433C9; Fri,  1 Sep 2023 06:28:28 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id DDEB7C433CA;
	Fri,  1 Sep 2023 06:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DDEB7C433CA
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.102])
	by gateway (Coremail) with SMTP id _____8AxlPAShPFkg7QdAA--.60663S3;
	Fri, 01 Sep 2023 14:26:28 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.102])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxXSMQhPFkGq1oAA--.37914S2;
	Fri, 01 Sep 2023 14:26:25 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	soc@kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 0/2] soc: loongson: Fix some issues about loongson2_guts
Date: Fri,  1 Sep 2023 14:25:47 +0800
Message-Id: <cover.1693534134.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxXSMQhPFkGq1oAA--.37914S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZrWxGFyDGF1kXF4fGw43CFX_yoWfWrcEka
	yIgw1xGr1UXF4ak3yjvF43Cry7uasFga4rCayYqF4Igry7tr13JrWrur93WF17XayxWrZx
	Ja1F9w1rZw1Y9osvyTuYvTs0mTUanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbfAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Cr1j6rxdM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8g6pPUUUUU==

Hi All:

I noticed that there were some minor changes to loongson2_guts on the
mailing list earlier, but they were put on hold because they were not
cc'd to the appropriate people (Arnd & soc@kernel.org).

I'd like to try to gather them together and resubmit them.

For patch[1], I modified the patch to use generic functions and
simplify the code.

Original link:
patch[1]: https://lore.kernel.org/loongarch/20230306025308.248987-1-dzm91@hust.edu.cn/
patch[2]: https://lore.kernel.org/loongarch/a69170cb55cfc73e378b40ccf1d9c16f@208suo.com/

Thanks.

Dongliang Mu (1):
  soc: loongson: loongson2_guts: Convert to
    devm_platform_ioremap_resource()

Mingtong Bao (1):
  soc: loongson: loongson2_guts: Remove unneeded semicolon

 drivers/soc/loongson/loongson2_guts.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.39.3

