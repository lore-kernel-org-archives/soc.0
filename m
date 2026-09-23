Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D014EB85D
	for <soc@lists.linux.dev>; Wed, 23 Sep 2026 16:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181695; cv=none; b=ExiL+ePA5BuwnyC+jt8zLOghaXgmDm0KzH03fm5S5QAIx/vNND6ihugyD1eK6AYhIEBFzBcm8O7CKD+gp07W4Iy8ZFKf53F96MCjRKq+PMEx7fhAdce2J3igDZnA5EHhi/VPfPLnZyeMOt4bH0zGk04J6ukyudEZcpR2/pcHxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181695; c=relaxed/simple;
	bh=Z8XEHb1n1t6otZovQjQ0kiiXzql5nBBKA0LjXK4CdnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g9vZMbJ8tKtUJ6wUKQayTQUiFKSMu8DtOIlTCc28gvN0lQ2d+WqVw8i0dzd0ve2b61YUlj3vDSePzw12VC8Qoj+QsTWsVk9diiPwhVqIEKXLTOxh3PmqV+QWHADofO39JDve6z5BIBR/kH7sBPJmm98OoblYYRMmiPK73ml9oJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X4YBuvM0; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X4YBuvM0"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so10139826d6.1
        for <soc@lists.linux.dev>; Wed, 23 Sep 2026 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181686; x=1790786486; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=X4YBuvM0aIN4wz9kDg41broDwm4bHhKFC5KIkyiap3Y6z5hl1oEp6pZg/TnJDXgtLW
         1l189RxnGjQZGo3/dNAORGDzw5WWZ399x3ZZdCLNyAvzJp3jzSdFI00/t6NAbzB8IovA
         6rJWNAse0AIJGy7mNBP9LpvTOLEAbitnRx/X4r30bomyJwYpU4iQg6cYmjuBGbXVu8Fa
         WEy0u4G7TuRNB6E0EzCT81hs0SCscVwWJOhbvYOOkX9P3KTj4U1LUMCMs5huI0nqmYoK
         YkK8MZZjubmW9MK3lDL2FVE86oNCi4zVI1KQ3JOyXABcB2bt5ALBEBhw2/E4mFD6ebEr
         qp6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181686; x=1790786486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7BzNuazOcXSzuWsG/mzzOpckUomlPcZX4HNgS2NA/iA=;
        b=2jqJmX/BkK0qmBSUyvJxWDt3uXWxmJ3xZ95jIKdbUEvBlXja4TXaCMIyIEQAg3tB0O
         fr3/stuRUC/D/IWcI0uplzn7r4Pr9piGs0yhrL5OTymsBN/jQuhfiGoHwuza/0wlvQPU
         R4MESm06kYzkNpviXUGdK5Pq7gcpBu0bYeuUrrsWyRrdRJNacAoZubh0LQl+fud4DjC6
         3KySF+MF/CcBLXdv0ANx/fuACm0DjthXN6kL9z2gWWg2arCEf/RV+3cY0/bYpdc4g2qa
         iDZGZsbWEFKjUBiOb4w1zvhUNwPXSRi1XRuRStNm5gu4kEz1+6ePCRqWVTIHcYciEnxz
         gVWw==
X-Forwarded-Encrypted: i=1; AKwUvByQpo2UXHh2ouc7Fn0HU+pu84j1Sy5uykpegjlzOT0In+hPZGVEE1++qOswB8ZITX3a4YQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kPrfmYVak8ADdNKqLVm8x6wYg9OuerTNOWb5xXKdqASCQUqA1T
	A+fdK7ZIEDfmA3bvl9n69OWUKyWjkXVG7mtOoj71EBUvxTgPrxtJm5fr
X-Gm-Gg: AYBFou0IktpnUyaHe56QQ3fY0YamFyNCtSIVAv3XxC6mlDr1wJstvJjEFK+cLj3te+L
	anowmV9smejTt5OMBENANyENQi9AZwt2JNXjvpmf+dVcI0Q3NNx3iMbrlvMf7blVeJwYLorr4Qt
	Ztv6CWSHx5U6fckj5hx6mXqqfKCdLMRJMhCp+TfLVmFAydO4DNODf6FLnEQHb7UQHsyJ2+j1cDE
	mF8nwTnQaNLO+3KlUHzu1GCOQg+EE38OUYwgZ5q4EHn0UIYr6Ms8AdSKWS7I9ej8TPvIs6KfMDC
	kv7ZEU2xMhH+vXOIlKnVd/tB5hI8P+4tdAO34L/1SVh3G//vphRTLNYQuabyYUAxx8c0OxRu/EZ
	8/K8o2IWdRvMU2o3tDb87N80Cr/NLwVz/yttdHD1egaFEKMfCnaFjGw62wCerVYFkjdG97zzllD
	XJeLYcK6QAUkj9SetLslM6XC1ujPVv5ZstrFS+WB5OoGfxZzsTRdFp76hUdyYZHC4m6EkRgODnW
	3QOqWN0fZqQH34WKBXjYtzb9lDkkzDg
X-Received: by 2002:a05:620a:1994:b0:937:27fb:96f8 with SMTP id af79cd13be357-93c251e0964mr496039185a.41.1790181685674;
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c248e22f7sm258625685a.47.2026.09.23.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:41:25 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop cci-control-port node reference in __cci_ace_get_port()
Date: Wed, 23 Sep 2026 12:40:55 -0400
Message-ID: <20260923164122.596910-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__cci_ace_get_port() looks up the device's "cci-control-port" node with
of_parse_phandle(), which returns the node with its reference count
raised, and only compares the pointer against the probed ports.  Neither
the match nor the no-match return releases it.

Drop the reference on both paths once the comparison is done.

Fixes: ed69bdd8fd9b ("drivers: bus: add ARM CCI support")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..223b1fe19ba06 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -167,9 +167,12 @@ static int __cci_ace_get_port(struct device_node *dn, int type)
 	cci_portn = of_parse_phandle(dn, "cci-control-port", 0);
 	for (i = 0; i < nb_cci_ports; i++) {
 		ace_match = ports[i].type == type;
-		if (ace_match && cci_portn == ports[i].dn)
+		if (ace_match && cci_portn == ports[i].dn) {
+			of_node_put(cci_portn);
 			return i;
+		}
 	}
+	of_node_put(cci_portn);
 	return -ENODEV;
 }
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

