Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDF11A724C
	for <soc@lists.linux.dev>; Thu, 20 Feb 2025 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740039458; cv=none; b=OFL27/QRkZAjDQINkxZfcpFNUobs/boHp1lzSFglojJXeY6EZOD6kzePViY1poPa2lbDxe8bsj+noiKcp7wHPEAhehZxr1TU7Rw+Pkgxuj+FcCieiJ9KvCK1cBUl2njf9OivI35aDouV6bUNyOjUnsjmbKRdkylQCzlUQYbe9/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740039458; c=relaxed/simple;
	bh=oCazgK2J+JQNRdaJ2W40CLpySIyip95iAnugNazXwnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cW3tsfzGe5msH+uvJZWNwtEvhEYJmxRzFarvDbUkZS0V2XkAr/4lq/J8wsPcz8fONlpFlB2jcGqQDCcRpk3dl5ynvtsEBVCcLbNinq+4g3Qplwid6vPmvVqmRbFKuKAISWy5c05q/6DyDNs0FreBpyIA5+iihGejOdjcfxX5T+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=S3MuI+AH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="S3MuI+AH"
Received: by smtp.kernel.org (Postfix)
	id BD97AC4CEDD; Thu, 20 Feb 2025 08:17:37 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.kernel.org (Postfix) with ESMTP id F1740C4CED1
	for <soc@kernel.org>; Thu, 20 Feb 2025 08:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F1740C4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=i7pov
	A4zdsdkdu9JehhxCixgUWiQ2gMIpi3PyPSESfA=; b=S3MuI+AH5uSmisdho40my
	VkE3DOD0f5E6FypOnjiCpzowpK9HyoAR/mGCc+yqJOTCFB3ItGQ9FG8sdZWJ6CkI
	RJivdpcGs58jy/ziTVGhljMQCNG0SX+nhqE7EyaoaE6E0XEWJ6y4qbNsQJ+FgbN2
	GEn0BvMXBoEl4lIL+Y8rX0=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wBnjX8O5bZnl9BpMw--.6425S4;
	Thu, 20 Feb 2025 16:17:19 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: zhuyinbo@loongson.cn,
	arnd@arndb.de,
	zhoubb.aaron@gmail.com
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	soc@kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] soc: loongson: loongson2_guts: Add check for devm_kstrdup()
Date: Thu, 20 Feb 2025 16:17:14 +0800
Message-Id: <20250220081714.2676828-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wBnjX8O5bZnl9BpMw--.6425S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7XFykGF17tr1DXF4kAFWrKrg_yoW8JrWUpF
	ZIy348WFWUXF1fZ3s8Ja48XFyYka45WasrXF4xXwnrWFykA3WUW343JFy0vw4fZry8Ga4j
	qFykKrW3CFy5CrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE6pBsUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbB0gf5bme2z+Ai3QABsC

Add check for the return value of devm_kstrdup() in
loongson2_guts_probe() to catch potential exception.

Fixes: b82621ac8450 ("soc: loongson: add GUTS driver for loongson-2 platforms")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
Changes in v2:
- modify the check position. Thanks, Binbin!
- modify the title description.
---
 drivers/soc/loongson/loongson2_guts.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/loongson/loongson2_guts.c b/drivers/soc/loongson/loongson2_guts.c
index ae42e3a9127f..16913c3ef65c 100644
--- a/drivers/soc/loongson/loongson2_guts.c
+++ b/drivers/soc/loongson/loongson2_guts.c
@@ -114,8 +114,11 @@ static int loongson2_guts_probe(struct platform_device *pdev)
 	if (of_property_read_string(root, "model", &machine))
 		of_property_read_string_index(root, "compatible", 0, &machine);
 	of_node_put(root);
-	if (machine)
+	if (machine) {
 		soc_dev_attr.machine = devm_kstrdup(dev, machine, GFP_KERNEL);
+		if (!soc_dev_attr.machine)
+			return -ENOMEM;
+	}
 
 	svr = loongson2_guts_get_svr();
 	soc_die = loongson2_soc_die_match(svr, loongson2_soc_die);
-- 
2.25.1

