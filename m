Return-Path: <SRS0=hN7X=XU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FAB5C433EF
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 22:12:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33ECCC3411E; Fri, 15 Jul 2022 22:12:10 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9B987C34115
	for <soc@kernel.org>; Fri, 15 Jul 2022 22:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9B987C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id g17so4284171plh.2
        for <soc@kernel.org>; Fri, 15 Jul 2022 15:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shgtDJajBST2wuzUZR1xcZGCs1ODhpS/VT+YQTPA2ak=;
        b=pOkyzv5OKlO+sk9TZjqFEb08GxCLiwgIIp1EF8qtaHrU6OZgQ0siwU2kPj/voSiT5F
         KDKkySA2YUcFKDWAOcTslazh55aSW+wEa5XxxLfiE/L7zsIzWx6dNrQfvJzFOZFqVRdh
         K4VFvctOQzYSXcb3QBxrAbBN9NnRUqYw1L8QaMkB3W6DYiBDJVg2+ErxNhq9rQlHk0rY
         uHc8nNDZjCvldsNiVoNPFRcPFIXeo9M5vhb11RI4nZ8BYUJd9vjiTNVIideyCW55IZAz
         DecjKp+ZcuNeKOh/J1d18WiIKzGJ4Z85hf3gPtsa22/zAlbtPAn6V46ZYylqqVUMgVxQ
         IV7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=shgtDJajBST2wuzUZR1xcZGCs1ODhpS/VT+YQTPA2ak=;
        b=B/zYGJZNvUVAbfpyqWCigB42XoGSw6E8cXw5itlxrwRRFftBG0bvDrwlwQX18gVvAe
         wcZ2fOjmJRbhNbjAkb20PfhQWP2ZtZOULEufA72FcTI6kOoN4A6xYtr70d/QwaGqLM09
         ccUIxfn+J7NG3smPNjykwfd2+R80nfd34JkNSY/K5GjReknj0OZeyTlkqFPpqfRU0S3U
         q4Ca1W8CHxM4/wQ/yw6NBB3lhWs5PApCsJem3jfmVGnwk1TGWNXJ7trqO47hQ2R+PQ4g
         F7chtSXnDndcWf0Na96SGx6HVDoXNJeNVHxCvps6cTTZ7pL8EGQseQVzYTWDEHip8N9d
         q1Vw==
X-Gm-Message-State: AJIora+us69xDcEwmrl04GNSxel1p4qcUToNp0HJmKGcUMfP2ktGfE6g
	1vI2e39/ONiuWRsUd6ermoxhmCXe8kw=
X-Google-Smtp-Source: AGRyM1uzDNAj7CfeHXG5hJhMIz4Zij9yUFWOXiHOcY1xE6bUMGSS7airu/qMi4s/Z1OGhbrp9ZsmaQ==
X-Received: by 2002:a17:90b:3b90:b0:1ef:eb4a:fbd with SMTP id pc16-20020a17090b3b9000b001efeb4a0fbdmr18516790pjb.2.1657923128653;
        Fri, 15 Jul 2022 15:12:08 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902d34500b0016c3b0042d0sm4039424plk.14.2022.07.15.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:12:08 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/3] Broadcom ARM SoC changes for 5.20 part 2
Date: Fri, 15 Jul 2022 15:12:01 -0700
Message-Id: <20220715221204.295936-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Arnd, Olof,

We had some late changes that are non functional except the addition of
the Asus GT-AX6000 DTS file. Some clarification of the BCA acronym and a
preparatory step to remove ARCH_BCM4908 in favor of ARCH_BCMBCA.

Thanks!
-- 
2.25.1

