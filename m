Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE0D30B514
	for <soc@lists.linux.dev>; Tue,  3 Mar 2026 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772521626; cv=none; b=J+Pd0rxngYk5r/PpwsnO1pXFbFUPmnfIkgJlSgpK4R7Ksp+uCWHRni50vuZ20B77gql1fAIA5d9U2ovRizmOD7Ia1dagFdhmV8BR1RmLbbiosQBpSM++k4Ha+oVe9Mlh1u6yW+IoJOS8VbIXea4WD7RHyhpZZWZ16+KD7/LgbmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772521626; c=relaxed/simple;
	bh=eVNij862v85tR6MBDOa2teZvuozAxO+pCCEnMOL6Oz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uYsBWU7Ymwx40PZVpCfw+avcGq7QgAIrwVjlS6gJRWV5VTGqQc8qWo8vZu/RZhhiCZcF8+JQQGxEKTjZX7wW+SAqXr0fgo+aPwEK6GSw2NMStnPA4LtOT+1Rp+iGFdnEw64EMhOZZlh0y/Bd/lShGO6dr2mRyNo79KXfWsiu5bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9AF70C2BC87; Tue,  3 Mar 2026 07:07:05 +0000 (UTC)
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.kernel.org (Postfix) with ESMTP id 7DD6FC116C6;
	Tue,  3 Mar 2026 07:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DD6FC116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.227])
	by gateway (Coremail) with SMTP id _____8AxgsCSiKZp8_AWAA--.10050S3;
	Tue, 03 Mar 2026 15:06:58 +0800 (CST)
Received: from kernelserver (unknown [223.64.68.227])
	by front1 (Coremail) with SMTP id qMiowJCxWeCRiKZp14VNAA--.16604S2;
	Tue, 03 Mar 2026 15:06:58 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	soc@kernel.org,
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH] soc: loongson: loongson2_guts: Use of_root instead of own reference
Date: Tue,  3 Mar 2026 15:06:42 +0800
Message-ID: <20260303070642.2785715-1-zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxWeCRiKZp14VNAA--.16604S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/1tbiAQEPCGmmeEEBzQAAs9
X-Coremail-Antispam: 1Uk129KBj93XoW7trWkWr4DtrWDGr1rCw47Jrc_yoW8WF13pF
	sakay5KF4Utrs7u3s8Aa48Wa4Yk3y0ga9xJF4xJws7WF98A3W7Wry3JF1Yvr4fZFy8C34U
	XFyvg3yUCa4UWrcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8czVUUUUUU==

There is already a global of_root reference. Use that instead of getting
one on our own. We don't need to care about the reference count either
this way.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 drivers/soc/loongson/loongson2_guts.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index 16913c3ef65c..d32ec0748b12 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -92,7 +92,7 @@ static u32 loongson2_guts_get_svr(void)
 
 static int loongson2_guts_probe(struct platform_device *pdev)
 {
-	struct device_node *root, *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
 	const struct loongson2_soc_die_attr *soc_die;
 	const char *machine;
@@ -109,11 +109,8 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
-	/* Register soc device */
-	root = of_find_node_by_path("/");
-	if (of_property_read_string(root, "model", &machine))
-		of_property_read_string_index(root, "compatible", 0, &machine);
-	of_node_put(root);
+	if (of_property_read_string(of_root, "model", &machine))
+		of_property_read_string_index(of_root, "compatible", 0, &machine);
 	if (machine) {
 		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
 		if (!soc_dev_attr.machine)

base-commit: 862ad12fb14cdad9c647100fbc16f7d8171b4470
-- 
2.52.0

