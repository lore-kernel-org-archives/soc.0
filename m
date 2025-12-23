Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8381338591
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766500057; cv=none; b=LqfFTyT97kVhJNSS9zZHIRFHaDjU8HTk50xitPk9B4YBuYURvw3DZ/J8Io7pv3cYxczyyq6n5/8ekD9QCWZSYqXmlfIeHK2slVcMaO6rslPEH1bV1MW9H4Vk5VuDAmI5PaMdAdO8vrStAS18iTOY9LNrPp7SI2cwZLSs+DMgovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766500057; c=relaxed/simple;
	bh=znQnP7Fd/J5vrSbB2hX4Rw2tMOJPzDja/Y8g2yuXw2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZSEGbN4vGIJOmK9PdklWaZbo193f00QTkTjLRDpzV4nkI3NZ2EM8UlnJXpwjLfGf9AuiEhc3O9fjPHD+QQmd5pSBbsYUED84v02r6bdzrZuawtGnwkTrUO9ugsJF1rf05YSxsAuadwPpQ2yiPuh5YpZPsTcMn23avErZwfEevpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xh5icLOo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqFQBFTp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xh5icLOo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqFQBFTp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNAWf901529028
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUG
	F/dKhzzg=; b=Xh5icLOoy8CU/2EzGLuFAqRy0WBYl8KrKW9HXBk3aR6vLYBTiqL
	SOwWsKei1Zf6s83ixUg+C4EvXDD0q1JKfrLj8bBoJAz0ewklu+M5ioIMqKRtrQlK
	Q+rxIqhfn/2anfupmKmhOkevUh1D66rP0wt5vZCFfJZM5FnygtPwPvVrWcTM96v8
	FROCNXybd6PwFJcINQ4EZ2RJwJrgme7Idc4ug06d4IidPz+F9uyPolgaopUuUF+a
	JwORV5TOtDP/3Kk3XBeL5uguqVHtuodRF2l13AZigdERWG82l771/RtWyKArJioy
	uaf6tBYfQC+1YPG9shTQHrOsq+830me6OrQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b758y4736-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <soc@lists.linux.dev>; Tue, 23 Dec 2025 14:27:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4f4d60d1fbdso53559461cf.3
        for <soc@lists.linux.dev>; Tue, 23 Dec 2025 06:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766500053; x=1767104853; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=dqFQBFTpNQp/Ju4Xi/fZKTqb3Aewy9PLgtOXnaXhPyK4WhrObHZemP1MGmP22eN+h4
         T01JdsTsy+JU6dyQrdrQH9cLyOX+fh0f7jUqy48ya9161rQ6hBIhdqABSmZXnanyhMll
         7OyUt/CiMfqCGSa4U3nWZ2qIDwmL8ju1H7UqW5UqGEP6xveYqb7sohJRPW4NCuFZ/8oI
         0ozknumQZMaU9mbF8GqK42mSHTl+yfSOVWrjhqUp+LsIOsCUnM3Z+vZsrPkOA0s7XB9W
         aXvc/nsgfGCSgItdLZxBu+F5fWyO4uQmeMwPxY1CCIABxX3rA9MG1+emlXHlCNC1J0ef
         MhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766500053; x=1767104853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ30YGSEauJtFo8hpiRxrvYts8bfPlLpCUGF/dKhzzg=;
        b=XpUm2NsZoRveDmQh+SdeX8f7RJ7gKrIG7leP00IStfDHQVHA9L8+SMNyILOJH6ehz3
         EPRs71iOmd+MJGzrDcRK08JFnVAPvAISaPFnhUhwU1BigYaVDYJlKav1N19uuR064/Tr
         QNkEQjftTXZsq8BOKjTi727i8PbLIb87wq4MtKU0GcjSljjck3aPSAYQdb0KKkN211kg
         /Lh548iKC9J+JNLcw6+yH4UQXYG7MH6gZfbIRw2H8slPuUdalQQ7xnlvln15e+iK8N8H
         pWXfnqJq7RCTDogAF8MxI88TrDMycUmVIT9OzMqpFgBRZXqDdT8nj0ea+7qb8UtO6Dk7
         ojMg==
X-Forwarded-Encrypted: i=1; AJvYcCV+8K/Q23S2F11Ib5YNJ6QHlmohcXZHJdokcCCpMT0p843zaboowx3XIQLmVEYxAcfdpP4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzcT0nAqOcLVIyxWcDm48sameSMW9epj310g7CRyiBcMIcAde+t
	RT+urt2NrLX6Hf8qhxZT3bGYxPGsQGODbn+1Iwv4ul5XiOSmXPZ4K7/3DCOxNMpJPqdrUEBm56f
	sPbGrwnDqhZyg7+pkhaa2wRvA2V8LpXoUJBToxBVmRl/TaXzqPetgIBo=
X-Gm-Gg: AY/fxX5q2qQqCuXc9C84jGzmu6Gl6QnGJDJTecAsCovrCKXHHGScHN9D6jDI5nVNnxK
	QMXlbHmJHhk4VwVXW6nUB5oXEp4fuhx3WT2VLpkey4SOfkJT2LSAoyM/nlw6ElPcAccw0whbBC9
	BQnK4lFfUpWvWyPUQlYElk8kvN3qzpM0mMDsnIuJtSHOcJRSMsn7Vu8ABILoflMzNwnCLebCVmU
	4PyhoqMxRvQhWEawEgaQ4q4Sq7soIM9J4aBbk4rh66nugM1wqr+Ctos3iIkPI6PMoKtMu0FuExc
	AYPYnL7g7b9rAZ6ZmKKZZahDNjcDF5n/t4GWSvSiiVm1Hpc+Y5NzAySVyz0PI3OQYn+/ba/WPOf
	oGRXn2RF33iil34x8XQasQrAt3JZv9HsgOOw/mSEd3hljhqbTzx89rif0A8fCk6+d8Xg=
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4211681cf.75.1766500053362;
        Tue, 23 Dec 2025 06:27:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHx+8Q5tBp9PpPU08NqJiNNbyikoFy4Mz31nrV8wUMn6eSen1oEP/1OGcxPp/BnoRTrVnnaNA==
X-Received: by 2002:a05:622a:7502:b0:4f4:df23:ab5d with SMTP id d75a77b69052e-4f4e39243a4mr4209811cf.75.1766500051064;
        Tue, 23 Dec 2025 06:27:31 -0800 (PST)
Received: from quoll.home (83.31.98.88.ipv4.supernova.orange.pl. [83.31.98.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037ab4f0dsm1436477166b.15.2025.12.23.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 06:27:30 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Drew Fustini <fustini@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] Documentation/process: maintainer-soc: Be more explicit about defconfig
Date: Tue, 23 Dec 2025 15:27:27 +0100
Message-ID: <20251223142726.73417-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1508; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=znQnP7Fd/J5vrSbB2hX4Rw2tMOJPzDja/Y8g2yuXw2w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpSqbODFu1+y29Lt26g5cF4++AiVq22ztuhgxKR
 XuzH+B6gZiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUqmzgAKCRDBN2bmhouD
 107MD/wIICO+f4FkJs5tEZJvvejnNMjbjFPpr4VfVOutTg4JZowCjaxlxhvjq0qkhxbKTPIzVCV
 FUpp/a1djgTc6iyN/uiE8gr0To9k3RvG+pyAkiUTB802B04PGsgnSK2He1X+XLLLCpGRwH6rztH
 Xtw+0SZ4lrE0cmXM/Zi0GIL2ZhMDTxmPNJKCsEMIjmKKDsX1uuW25tVwKQHCZwhi8QCRTw8wGQl
 Ent/elBNLhxTHc6NE+UK7Q5eWeH72mW9ViaoXflDomzLeYLiIbEBKxcN76GlXIsPQuWjX3EgVrA
 uTnfsnjwIm0WTNGRzpO5YOi9OgtX7HtazOqB5pevbp1g5BGyAP1A10ZXQY2xkoeF+F0Il/zqVeg
 XFP4AsjCaJiLBjUW7lYMWpAM25ZfifEScWn97r44K8xGd9GDqt7bkSowCQSIqpLQEbzGcDlYT45
 WLXdVGquWZ2GBOX5HlQbM+wCo5f/m4DJ0/Kz2wI669cjlFHb6P5JUcomqUFMUDYCxulnGKAYW9t
 YzAuCTG1oovPFMlgiyAgjcYsBbnG3U/6UHB93ZRQLA9FHeuLiDIKIK2URd8nqRRg2bvAc0RL/dL
 CcufkFpQKoZzDLdfjsddfFV/o4p0Ugl0cg4CJomoMiHE+ZK8Xvji/SBQzqwhF11kxQ6/t3Yu+T7 YwuSYEFw7uf+d5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TOdIilla c=1 sm=1 tr=0 ts=694aa6d6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=qe4J/qXhiWkb1JZGYKbLYA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=u2BcFdJyl2au2J_VFtgA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wzxaO0Dq3K-GNAgrGBlGsApp0AwUKfYg
X-Proofpoint-GUID: wzxaO0Dq3K-GNAgrGBlGsApp0AwUKfYg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDExOSBTYWx0ZWRfX0Iw7Ubj+j0Z/
 iCzUQhHrxankGSZ1cwZ/inFU7SLa9Is1TZKeLQ6pAGrjej2xt1zPA0Q9pXfEBuIspxSnPBSNM+8
 +CtDw4WscbSCnGSXWM/hqpIV5Je99MnyN++cYJ9az1ReeeyRF63WA3xPzT8WAeWxSkwwvosuu4x
 AASCeq1yNqXsT3XoSjv1Slt0ZJWjQh4QgE8lOyAfUFqCbdVN720fysC90jyZyGpsPl1Tr1z52mh
 WFud0/1/EqfJ4Q8ufeRwdvEAIB7gsxBKGca7aazfcU0EZX7qhg+6054qbtuj8PgDaRPKh8uEKpx
 PTijxvJBIGZXUgkrd99is9Ivviie+d+vDes3YHS5xnzvSm/WlPH6hLwLhcqP20Fjm5zpUK4QJkX
 LkRcAShx2Z3czpWwmJOx9QzSbNAwDUaEoKNPLSF0ybaxDRstybeYKn/FIYbxSvtQVX8o5ntOGNb
 kybglyp8pBLpxASFBlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230119

It is already documented but people still send noticeable amount of
patches ignoring the rule - get_maintainers.pl does not work on
arm64/configs/defconfig or any other shared ARM defconfig.

Be more explicit, that one must not rely on typical/simple approach
here for getting To/Cc list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Incorrectly addressed patches for arm64/defconfig are around ~2 per month...
---
 Documentation/process/maintainer-soc.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/maintainer-soc.rst b/Documentation/process/maintainer-soc.rst
index 3ba886f52a51..014c639022b2 100644
--- a/Documentation/process/maintainer-soc.rst
+++ b/Documentation/process/maintainer-soc.rst
@@ -57,8 +57,10 @@ Submitting Patches for Given SoC
 
 All typical platform related patches should be sent via SoC submaintainers
 (platform-specific maintainers).  This includes also changes to per-platform or
-shared defconfigs (scripts/get_maintainer.pl might not provide correct
-addresses in such case).
+shared defconfigs. Note that scripts/get_maintainer.pl might not provide
+correct addresses for the shared defconfig, so ignore its output and manually
+create CC-list based on MAINTAINERS file or use something like
+``scripts/get_maintainer.pl -f drivers/soc/FOO/``).
 
 Submitting Patches to the Main SoC Maintainers
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-- 
2.51.0

