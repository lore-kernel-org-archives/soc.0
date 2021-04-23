Return-Path: <SRS0=uhjA=JU=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B57FDC433ED
	for <soc@archiver.kernel.org>; Fri, 23 Apr 2021 00:09:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8BF8F613C3; Fri, 23 Apr 2021 00:09:37 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6325B613C0
	for <soc@kernel.org>; Fri, 23 Apr 2021 00:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6325B613C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=joel.stan@gmail.com
Received: by mail-pf1-f176.google.com with SMTP id h15so15215928pfv.2
        for <soc@kernel.org>; Thu, 22 Apr 2021 17:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vnxjnxKlM8DC61P/u0yqPe4n08V0jU+VTH9E28KdhuE=;
        b=W1evjmgJAc00MetDTNnsvDF7+Rai0JFXs5PtOYF6YW/f3cIs9H2WRoDI3ftfm5pKca
         KDa66I8AqpshWvm1Q4CzIeT5HppzPa+Mp4SmeYFBH4x29AgQwvNpYenEnVXsK7sn3evF
         5u3R3ENBe9JuPZTXymJu5K4NnBxrZek57E3KgLG7IRGTklwqHEjBIZubUCClLZHTbyDK
         Uq9TGUF4Nvz+8vtEYxNZ/fQCO6z8/Vlp5Hsq1zZErBkIrFjqcF2SsI0QdoNYfDOakKoC
         /m/BN8cqwTX4ZFDqPZClDvjPigjXaeWIuIZ2+6rE+SAt5nW4PynHV9m/6BGFMV7D6/wa
         48tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=vnxjnxKlM8DC61P/u0yqPe4n08V0jU+VTH9E28KdhuE=;
        b=mYqPvRt55x19YWP3Y/n57z8YGOxU4GBPhDKBIZYN88qBJ6ukjqcvy9hyf35UUHQVgD
         KwOJ/01f1KqXDSxjMH17gYbOHUWygA5ysV3uEgFwfxxDqbTsP9HxDDedU9XTIF+GGGWQ
         1VjH6ZGZ3rrVoO8nj1gfhLP7DRMFk/24gea1EDxaD6XgpJBadZel+uwDf/fDRWawAJYh
         wTf36uAKajLTSIwrVWq26ncBCKpdwrczgpN2sswRaSYgtu5FLdyAmJ5sPk0tLFcfGy5c
         H2SGBwSRMiaqdNc8XLDjQCbJmx1VIaDjIpteJlCyK2pXFYU9x9o7cTq2xK56lDuSNTcv
         MC8w==
X-Gm-Message-State: AOAM531hPXrCZwDRzPyjQ18gKnwJasFkVGcYuasFM03/LEQ6IIzypKtm
	O13PercILstNcDrNapeLjWSxqURm0lA=
X-Google-Smtp-Source: ABdhPJwFTzrc8Rw0/k800iJA1+ZKFrAOxqrT97muMvfaV69Poey4F9NrQ4vvi1I9HG4R8WVn5AyxiA==
X-Received: by 2002:a65:590a:: with SMTP id f10mr1196446pgu.358.1619136576383;
        Thu, 22 Apr 2021 17:09:36 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id x2sm2916271pfu.77.2021.04.22.17.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Apr 2021 17:09:35 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Patrick Venture <venture@google.com>
Subject: [PATCH] soc: aspeed: fix a ternary sign expansion bug
Date: Fri, 23 Apr 2021 09:39:19 +0930
Message-Id: <20210423000919.1249474-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dan Carpenter <dan.carpenter@oracle.com>

The intent here was to return negative error codes but it actually
returns positive values.  The problem is that type promotion with
ternary operations is quite complicated.

"ret" is an int.  "copied" is a u32.  And the snoop_file_read() function
returns long.  What happens is that "ret" is cast to u32 and becomes
positive then it's cast to long and it's still positive.

Fix this by removing the ternary so that "ret" is type promoted directly
to long.

Fixes: 3772e5da4454 ("drivers/misc: Aspeed LPC snoop output using misc chardev")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Patrick Venture <venture@google.com>
Link: https://lore.kernel.org/r/YIE90PSXsMTa2Y8n@mwanda
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Soc maintainers, can you please apply this fix.

 drivers/soc/aspeed/aspeed-lpc-snoop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 210455efb321..eceeaf8dfbeb 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -94,8 +94,10 @@ static ssize_t snoop_file_read(struct file *file, char __user *buffer,
 			return -EINTR;
 	}
 	ret = kfifo_to_user(&chan->fifo, buffer, count, &copied);
+	if (ret)
+		return ret;
 
-	return ret ? ret : copied;
+	return copied;
 }
 
 static __poll_t snoop_file_poll(struct file *file,
-- 
2.30.2

